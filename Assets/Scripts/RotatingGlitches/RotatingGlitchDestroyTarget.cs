using UnityEngine;
using System.Collections;

public class RotatingGlitchDestroyTarget : MonoBehaviour
{
    public void OnGlitchDetected(RotatingGlitchMeatingPoint sender,
        RotatingGlitchMeatingPoint.e_GlitchDetectionStatus glitchDetectionStatus)
    {
        switch (glitchDetectionStatus)
        {
            case RotatingGlitchMeatingPoint.e_GlitchDetectionStatus.ENTERING:
                Debug.Log("Ho merde je dois réagir.");
                break;
            case RotatingGlitchMeatingPoint.e_GlitchDetectionStatus.EXITNG:
                Debug.Log("C'est fatigué.");
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
