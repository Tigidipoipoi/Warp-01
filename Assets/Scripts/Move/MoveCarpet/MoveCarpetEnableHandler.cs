using UnityEngine;
using System.Collections;

[RequireComponent(typeof(BoxCollider))]
public class MoveCarpetEnableHandler : CleanBehaviourOnDestroy
{
    #region Members
    public bool m_PlayerCanDisplayCarpet = true;

    private MoveCarpetScript m_MoveCarpetScript;
    private BoxCollider m_CarpetCallZone;
    #endregion Members

    #region Unity Events
    public override void Start()
    {
        base.Start();

        m_CarpetCallZone = GetComponent<BoxCollider>();

        m_MoveCarpetScript = FindObjectOfType<MoveCarpetScript>();

        transform.parent = MVRCameraUtils.GetInstance.p_ShuttleContainer;
        ResetTriggerBounds();
    }

    public override void Die()
    {
        base.Die();

        Destroy(gameObject);
    }

    public void OnTriggerEnter(Collider enteringCollider)
    {
        if (enteringCollider.tag == "Player")
        {
            m_PlayerCanDisplayCarpet = true;
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == "Player")
        {
            m_PlayerCanDisplayCarpet = false;
            m_MoveCarpetScript.EnableMoveCarpet(false);
        }
    }
    #endregion Unity Events

    public void ResetTriggerBounds()
    {
        m_CarpetCallZone.size = ComputeTriggerBounds();
    }

    public Vector3 ComputeTriggerBounds()
    {
        float carpetColliderDiameter = m_MoveCarpetScript.GetComponent<CapsuleCollider>().radius;
        carpetColliderDiameter *= 2.0f;

        Vector3 newTriggerSize = ShuttleContainerScript.c_CaveSizeIRL;
        newTriggerSize.x -= carpetColliderDiameter;
        newTriggerSize.z -= carpetColliderDiameter;

        return newTriggerSize;
    }
}
