using UnityEngine;
using System.Collections.Generic;

public class RotatingGlitchMeatingPoint : MonoBehaviour
{
    #region Members
    public delegate void DestroyWallHandler(RotatingGlitchMeatingPoint sender);
    public static event DestroyWallHandler OnDestroyWall;

    public int m_RotatingGlitchCountToBreakWall;
    public GameObject m_ObjectToDestroy;

    [HideInInspector]
    public List<GameObject> m_PresentInTriggerRotatingGlitches = new List<GameObject>();
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_RotatingGlitchCountToBreakWall = transform.parent.GetComponentsInChildren<RotatingGlitchRendererHandler>().Length;
    }

    public void OnTriggerEnter(Collider enteringCollider)
    {
        RotatingGlitchRendererHandler enteringRotatingGlitch = enteringCollider.GetComponent<RotatingGlitchRendererHandler>();
        if (enteringRotatingGlitch != null
            && !m_PresentInTriggerRotatingGlitches.Contains(enteringRotatingGlitch.gameObject))
        {
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
            DestroyObjectToDestroy();
        }
    }
    #endregion Unity Events

    private void DestroyObjectToDestroy()
    {
        if (m_ObjectToDestroy == null)
        {
            return;
        }

        Destroy(m_ObjectToDestroy);
    }
}