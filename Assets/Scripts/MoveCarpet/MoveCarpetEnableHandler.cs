using UnityEngine;
using System.Collections;

[RequireComponent(typeof(BoxCollider))]
public class MoveCarpetEnableHandler : MonoBehaviour
{
    #region Members
    public bool m_PlayerCanDisplayCarpet;

    private MoveCarpetScript m_MoveCarpetScript;
    private BoxCollider m_CarpetCallZone;

    private ChangeSceneManager.DestroyLastLevelLoadedHandler m_DestroyHandler;
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_CarpetCallZone = GetComponent<BoxCollider>();

        m_MoveCarpetScript = FindObjectOfType<MoveCarpetScript>();

        // Prepare to clean on new scene load.
        m_DestroyHandler = new ChangeSceneManager.DestroyLastLevelLoadedHandler(Die);
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded += m_DestroyHandler;

        transform.parent = MVRCameraUtils.GetInstance.p_ShuttleContainer;

        ResetTriggerBounds();
    }

    public void Die()
    {
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
