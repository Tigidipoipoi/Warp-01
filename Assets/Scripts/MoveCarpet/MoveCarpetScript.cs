using UnityEngine;
using System.Collections;

public class MoveCarpetScript : MonoBehaviour
{
    [HideInInspector]
    public bool m_IsDisplayed = true;

    public void Start()
    {
        ToggleMoveCarpet();
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(2))
        {
            CenterCarpetOnPlayer();
            ToggleMoveCarpet();
        }
    }

    public void ToggleMoveCarpet()
    {
        m_IsDisplayed = !m_IsDisplayed;
        transform.EnableAllChildren(m_IsDisplayed);
    }

    public void CenterCarpetOnPlayer()
    {
        Vector3 playerPosition = MVRCameraUtils.GetInstance.p_PlayerTransform.position;
        playerPosition.y -= MVRCameraUtils.GetInstance.p_PlayerTransform.localPosition.y;

        transform.position = playerPosition;
    }
}
