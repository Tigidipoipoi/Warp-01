/* VRActor
 * MiddleVR
 * (c) MiddleVR
 */

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MiddleVR_Unity3D;

[AddComponentMenu("MiddleVR/Interactions/Actor")]
public class VRActor : MonoBehaviour
{
    [SerializeField]
    protected MVRNodesMapper.ENodesSyncDirection m_SyncDirection = MVRNodesMapper.ENodesSyncDirection.NoSynchronization;

    public MVRNodesMapper.ENodesSyncDirection SyncDirection
    {
        get
        {
            return m_SyncDirection;
        }
        set
        {
            _SetSyncDirection(value);
        }
    }

    public string MiddleVRNodeName = "";
    public bool Grabable = true;

    protected bool m_SyncDirIsSet = false;
    protected vrNode3D m_MiddleVRNode = null;

    [HideInInspector]
    public VRTouch.ETouchParameter TouchEvents = VRTouch.ETouchParameter.ReceiveTouchEvents;

    protected List<VRTouch> m_Touches = new List<VRTouch>();

    protected virtual void Start()
    {
        if (!m_SyncDirIsSet)
        {
            _SetSyncDirection(m_SyncDirection);
        }

        if (gameObject.GetComponent<Collider>() == null)
        {
            gameObject.AddComponent<BoxCollider>();
        }

        if (gameObject.GetComponent<Collider>() == null)
        {
            MVRTools.Log("[X] Actor object '" + gameObject.name +
                "' has no collider!! Put one or it won't act. ");
        }
    }

    protected virtual void _SetSyncDirection(MVRNodesMapper.ENodesSyncDirection iSyncDirection)
    {
        m_SyncDirIsSet = true;
        m_SyncDirection = iSyncDirection;

        var nodesMapper = MVRNodesMapper.Instance;

        if (iSyncDirection != MVRNodesMapper.ENodesSyncDirection.NoSynchronization)
        {
            // Set new MiddleVR - Unity nodes mapping if needed
            m_MiddleVRNode = nodesMapper.AddMapping(this.gameObject, MiddleVRNodeName, iSyncDirection);
        }
        else if (m_MiddleVRNode != null)
        {
            // No synchronization and existing mvrNode: stop node synchronization
            nodesMapper.RemoveMapping(m_MiddleVRNode.GetName());

            m_MiddleVRNode = null;
        }
    }

    public virtual vrNode3D GetMiddleVRNode()
    {
        // GetMiddleVRNode() can be called before Start(). In this case,
        // we need to call '_SetSyncDirection()'.
        if (m_SyncDirIsSet)
        {
            return m_MiddleVRNode;
        }
        else
        {
            _SetSyncDirection(m_SyncDirection);
            return m_MiddleVRNode;
        }
    }

    protected virtual void OnDestroy()
    {
        foreach (VRTouch touch in m_Touches)
        {
            _SendVRTouchEnd(touch, true);
        }

        // Stop node synchronization
        if (MiddleVR.VRKernel != null && m_MiddleVRNode != null)
        {
            MVRNodesMapper.Instance.RemoveMapping(m_MiddleVRNode.GetName());
        }
    }

    public virtual List<VRTouch> GetTouches()
    {
        return new List<VRTouch>(m_Touches);
    }

    // ***** RECEIVE TOUCH
    protected virtual void _OnMVRTouchBegin(VRTouch iTouch)
    {
        if (TouchEvents == VRTouch.ETouchParameter.ReceiveTouchEvents)
        {
            m_Touches.Add(iTouch);
            //MiddleVRTools.Log(2, "Touch begin: " + iSrc.name + ". NbTouch: " + m_Touches.Count );
            SendMessage("OnMVRTouchBegin", iTouch, SendMessageOptions.DontRequireReceiver);
        }
    }

    protected virtual void _OnMVRTouchMoved(VRTouch iTouch)
    {
        if (TouchEvents == VRTouch.ETouchParameter.ReceiveTouchEvents)
        {
            //MiddleVRTools.Log(2, "Touch end: " + iSrc.name + ".NbTouch: " + m_Touches.Count);
            SendMessage("OnMVRTouchMoved", iTouch, SendMessageOptions.DontRequireReceiver);
        }
    }

    protected virtual void _OnMVRTouchEnd(VRTouch iTouch)
    {
        if (TouchEvents == VRTouch.ETouchParameter.ReceiveTouchEvents)
        {
            m_Touches.Remove(iTouch);
            //MiddleVRTools.Log(2, "Touch end: " + iSrc.name + ".NbTouch: " + m_Touches.Count);
            SendMessage("OnMVRTouchEnd", iTouch, SendMessageOptions.DontRequireReceiver);
        }
    }

    // ***** SEND TOUCH
    protected virtual void OnTriggerEnter(Collider collider)
    {
        if (TouchEvents == VRTouch.ETouchParameter.SendTouchEvents)
        {
            GameObject touchedObject = collider.gameObject;

            // Other actor
            VRActor otherActor = touchedObject.GetComponent<VRActor>();

            if (otherActor != null)
            {
                VRTouch touch = new VRTouch();
                touch.TouchedObject = touchedObject;
                touch.TouchObject = this.gameObject;

                // Send message to touched object
                otherActor._OnMVRTouchBegin(touch);

                // Send message to ourself so attached script can also react
                this.SendMessage("OnMVRTouchBegin", touch, SendMessageOptions.DontRequireReceiver);
                m_Touches.Add(touch);
            }
        }
    }

    protected virtual VRTouch _FindVRTouch(GameObject iTouchedObject)
    {
        VRTouch touch = null;

        // Find existing VRTouch
        foreach (VRTouch touchInList in m_Touches)
        {
            if (touchInList.TouchedObject == iTouchedObject)
            {
                touch = touchInList;
            }
        }

        return touch;
    }

    protected virtual void OnTriggerStay(Collider collider)
    {
        if (TouchEvents == VRTouch.ETouchParameter.SendTouchEvents)
        {
            // We are the touch emitter
            GameObject touchedObject = collider.gameObject;
            VRActor actor = touchedObject.GetComponent<VRActor>();

            if (actor != null)
            {
                VRTouch touch = _FindVRTouch(touchedObject);

                if (touch != null)
                {
                    // Send message to touched object
                    actor._OnMVRTouchMoved(touch);
                    // Send message to ourself
                    this.SendMessage("OnMVRTouchMoved", touch, SendMessageOptions.DontRequireReceiver);
                }
            }
        }
    }

    protected virtual void OnTriggerExit(Collider collider)
    {
        if (TouchEvents == VRTouch.ETouchParameter.SendTouchEvents)
        {
            // We are the touch emitter
            GameObject touchedObject = collider.gameObject;

            VRTouch touch = _FindVRTouch(touchedObject);

            if (touch != null)
            {
                _SendVRTouchEnd(touch, false);
            }
        }
    }

    protected virtual void _SendVRTouchEnd(VRTouch iTouch, bool iOnDestroy)
    {
        // Other actor
        VRActor actor = iTouch.TouchedObject.GetComponent<VRActor>();

        if (actor != null)
        {
            // Send message to touched object
            actor._OnMVRTouchEnd(iTouch);
            // Send message to ourself
            this.SendMessage("OnMVRTouchEnd", iTouch, SendMessageOptions.DontRequireReceiver);

            // XXX Cb: in OnDestroy we are iterating over the m_Touches list
            // here we are removing an element, so in OnDestroy, foreach
            // complains that the list has been modified
            // There is probably a cleaner way to do this !!
            if (!iOnDestroy)
            {
                // Ourself
                m_Touches.Remove(iTouch);
            }
        }
    }
}
