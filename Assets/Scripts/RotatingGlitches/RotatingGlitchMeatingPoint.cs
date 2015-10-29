using UnityEngine;
using System.Collections.Generic;

public class RotatingGlitchMeatingPoint : MonoBehaviour
{
    public enum e_GlitchDetectionStatus
    {
        ENTERING = 0,
        EXITNG,

        COUNT
    }

    #region Events
    public delegate void DestroyWallHandler(RotatingGlitchMeatingPoint sender);
    public event DestroyWallHandler OnDestroyWall;

    public delegate void GlitchDetectedHandler(RotatingGlitchMeatingPoint sender, e_GlitchDetectionStatus glitchDetectionStatus);
    public event GlitchDetectedHandler OnGlitchDetected;
    #endregion Events

    #region Members
    public int m_RotatingGlitchCountToBreakWall;
    public GameObject m_ObjectToDestroy;

    [HideInInspector]
    public List<GameObject> m_PresentInTriggerRotatingGlitches = new List<GameObject>();
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_RotatingGlitchCountToBreakWall = transform.parent.GetComponentsInChildren<RotatingGlitchRendererHandler>().Length;

        if (m_ObjectToDestroy != null)
        {
            RotatingGlitchDestroyTarget destroyTarget = m_ObjectToDestroy.AddComponent<RotatingGlitchDestroyTarget>();
            OnDestroyWall += destroyTarget.OnDestroyByGlitch;
            OnGlitchDetected += destroyTarget.OnGlitchDetected;
        }
    }

    public void OnTriggerEnter(Collider enteringCollider)
    {
        RotatingGlitchRendererHandler enteringRotatingGlitch = enteringCollider.GetComponent<RotatingGlitchRendererHandler>();
        if (enteringRotatingGlitch != null
            && !m_PresentInTriggerRotatingGlitches.Contains(enteringRotatingGlitch.gameObject))
        {
            // We send the event only if it's the first detected glitch.
            if (OnGlitchDetected != null
                && m_PresentInTriggerRotatingGlitches.Count == 0)
            {
                OnGlitchDetected(this, e_GlitchDetectionStatus.ENTERING);
            }

            m_PresentInTriggerRotatingGlitches.Add(enteringRotatingGlitch.gameObject);
            enteringRotatingGlitch.ActivateGlitchedMaterial();
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        RotatingGlitchRendererHandler exitingRotatingGlitch = exitingCollider.GetComponent<RotatingGlitchRendererHandler>();
        if (exitingRotatingGlitch != null
            && m_PresentInTriggerRotatingGlitches.Contains(exitingRotatingGlitch.gameObject))
        {
            m_PresentInTriggerRotatingGlitches.Remove(exitingRotatingGlitch.gameObject);
            exitingRotatingGlitch.ActivateOrdinaryMaterial();

            // We send the event only if it's the last detected glitch.
            if (OnGlitchDetected != null
                && m_PresentInTriggerRotatingGlitches.Count == 0)
            {
                OnGlitchDetected(this, e_GlitchDetectionStatus.EXITNG);
            }
        }
    }

    public void Update()
    {
        if (m_PresentInTriggerRotatingGlitches.Count == m_RotatingGlitchCountToBreakWall)
        {
            if (OnDestroyWall != null)
            {
                OnDestroyWall(this);
            }
        }
    }
    #endregion Unity Events
}