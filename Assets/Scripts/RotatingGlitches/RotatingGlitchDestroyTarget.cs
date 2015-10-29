using UnityEngine;
//using System.Collections;

public class RotatingGlitchDestroyTarget : MonoBehaviour
{
    #region Members
    public Renderer m_Renderer;
    public Color m_OriginalColor;
    public Color m_ReactionColor = Color.magenta;
    #endregion Members

    public void Start()
    {
        m_Renderer = GetComponent<Renderer>();

        m_OriginalColor = m_Renderer.material.color;
    }

    public void OnGlitchDetected(RotatingGlitchMeatingPoint sender,
        RotatingGlitchMeatingPoint.e_GlitchDetectionStatus glitchDetectionStatus)
    {
        switch (glitchDetectionStatus)
        {
            case RotatingGlitchMeatingPoint.e_GlitchDetectionStatus.ENTERING:
                m_Renderer.material.color = m_ReactionColor;
                break;
            case RotatingGlitchMeatingPoint.e_GlitchDetectionStatus.EXITNG:
                m_Renderer.material.color = m_OriginalColor;
                break;

            default:
                return;
        }
    }

    public void OnDestroyByGlitch(RotatingGlitchMeatingPoint sender)
    {
        sender.OnDestroyWall -= OnDestroyByGlitch;
        sender.OnGlitchDetected -= OnGlitchDetected;

        Destroy(gameObject);
    }
}
