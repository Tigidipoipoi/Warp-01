using UnityEngine;
using System.Collections;

public class RotatingGlitchPointToStop : CleanBehaviourOnDestroy
{
    #region Members
    public float m_MaxRange;

    [Range(0, 4)]
    [Tooltip("There are 5 buttons on the Senso Light & Shadows, so choose in the range 0 to 4.")]
    public uint m_InteractionButton;
    public RotatingGlitchMove m_RotatingGlitchStopped;

    private bool m_InteractionButtonPressed;
    public bool p_InteractionButtonPressed
    {
        get
        {
            return m_InteractionButtonPressed;
        }
        set
        {
            if (!m_InteractionButtonPressed
                && value)
            {
                TryToStopRotatingGlitch();
            }
            else if (m_InteractionButtonPressed
                && !value)
            {
                FreeStoppedGlitch();
            }

            m_InteractionButtonPressed = value;
        }
    }

    private int m_FloatingGlitchLayer;
    #endregion Member

    public override void Start()
    {
        base.Start();

        m_FloatingGlitchLayer = LayerMask.GetMask(RotatingGlitchMove.c_RotatingGlitchLayerName);
    }

    public override void Die()
    {
        base.Die();

        Destroy(gameObject);
    }

    public void Update()
    {
        p_InteractionButtonPressed = MiddleVR.VRDeviceMgr.IsWandButtonPressed(m_InteractionButton);
    }

    public void TryToStopRotatingGlitch()
    {
        FreeStoppedGlitch();

        RaycastHit hitInfo;

        if (CheckRotatingGlitchIsReachable(out hitInfo))
        {
            m_RotatingGlitchStopped = hitInfo.collider.GetComponent<RotatingGlitchMove>();
            if (m_RotatingGlitchStopped != null)
            {
                m_RotatingGlitchStopped.p_FreeToRotate = false;
            }
        }
    }

    public void FreeStoppedGlitch()
    {
        if (m_RotatingGlitchStopped == null)
        {
            return;
        }

        m_RotatingGlitchStopped.p_FreeToRotate = true;
        m_RotatingGlitchStopped = null;
    }

    public bool CheckRotatingGlitchIsReachable(out RaycastHit hitInfo)
    {
        Transform wandTrans = MVRCameraUtils.GetInstance.p_WandTransform;
        Ray ray = new Ray(wandTrans.position, wandTrans.forward);
        Debug.Log(ray.origin);
        Debug.DrawLine(ray.origin, ray.origin + (ray.direction * m_MaxRange), Color.red, Mathf.Infinity);

        return Physics.Raycast(ray, out hitInfo, m_MaxRange, m_FloatingGlitchLayer);
    }
}
