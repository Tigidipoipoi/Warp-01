﻿using UnityEngine;
using System.Collections;

public class MovePointing : MonoBehaviour
{
    #region Members
    [Range(0, 4)]
    [Tooltip("There are 5 buttons on the Senso Light & Shadows, so choose in the range 0 to 4.")]
    public uint m_WandButtonToMove;

    public float m_MoveSpeed = 0.001f;

    private bool m_MoveButtonPressed;
    public bool p_MoveButtonPressed
    {
        get
        {
            return m_MoveButtonPressed;
        }
        set
        {
            if (!m_MoveButtonPressed
                && value)
            {
                StartMoveShuttleInDirection();
            }

            m_MoveButtonPressed = value;
        }
    }
    #endregion Members


    public void Update()
    {
        p_MoveButtonPressed = MiddleVR.VRDeviceMgr.IsWandButtonPressed(m_WandButtonToMove);
    }

    public void StartMoveShuttleInDirection()
    {
        StopCoroutine("MoveShuttleInDirection");
        StartCoroutine("MoveShuttleInDirection");
    }

    private IEnumerator MoveShuttleInDirection()
    {
        yield return new WaitForEndOfFrame();

        Vector3 moveDirection = new Vector3();
        while (m_MoveButtonPressed)
        {
            if (MVRCameraUtils.GetInstance.p_WandTransform != null)
            {
                moveDirection = MVRCameraUtils.GetInstance.p_WandTransform.forward;
            }
            MVRCameraUtils.GetInstance.SetShuttlePosition(moveDirection * m_MoveSpeed, additive: true);

            yield return null;
        }
    }
}