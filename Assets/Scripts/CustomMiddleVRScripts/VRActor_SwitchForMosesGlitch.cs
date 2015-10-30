/* VRActor
 * MiddleVR
 * (c) MiddleVR
 */

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MiddleVR_Unity3D;

public class VRActor_SwitchForMosesGlitch : VRActor
{
    #region Members
    protected VRInteractionManipulationRay m_GrabEventSender;
    protected Transform m_WandTransform;
    protected int m_CollisionMask;
    #endregion Members

    protected override void Start()
    {
        base.Start();

        m_GrabEventSender = FindObjectOfType<VRInteractionManipulationRay>();
        if (m_GrabEventSender != null)
        {
            m_GrabEventSender.OnGrab += OnGrab;
        }

        m_WandTransform = MVRCameraUtils.GetInstance.p_WandTransform;

        m_CollisionMask = LayerMask.GetMask("TangibleGlitch");
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();

        if (m_GrabEventSender != null)
        {
            m_GrabEventSender.OnGrab -= OnGrab;
        }
    }

    public void OnGrab(VRInteractionManipulationRay sender, VRInteractionManipulationRay.e_GrabStatus grabStatus)
    {
        switch (grabStatus)
        {
            case VRInteractionManipulationRay.e_GrabStatus.GRABBED:
                StartCoroutine("SyncPositionToWandTransform");
                break;
            case VRInteractionManipulationRay.e_GrabStatus.UNGRABBED:
                Debug.Log("Ungrabbed !");
                StopCoroutine("SyncPositionToWandTransform");
                break;
            default:
                return;
        }
    }

    public IEnumerator SyncPositionToWandTransform()
    {
        Utils.ClearLog();
        Ray ray = new Ray(m_WandTransform.position, m_WandTransform.forward);
        float rayLength = m_WandTransform.GetComponent<VRWand>().DefaultRayLength;
        RaycastHit hitInfo;
        Vector3 newPosition = transform.position;

        while (true)
        {
            ray.origin = m_WandTransform.position;
            ray.direction = m_WandTransform.forward;
            Debug.DrawLine(ray.origin, ray.origin + ray.direction * rayLength, Color.red, 20.0f);
            if (Physics.Raycast(ray, out hitInfo, rayLength, m_CollisionMask))
            {
                newPosition.y = hitInfo.point.y;
                newPosition.z = hitInfo.point.z;
                transform.position = newPosition;
            }

            yield return null;
        }
    }
}
