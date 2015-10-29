using UnityEngine;
using System.Collections;

public class PlayerPresenceGlitchScript : PlayerPresenceReactingScript
{
    public float c_RotationSpeed = 20.0f;

    public override void OnPlayerPresenceDetected(PlayerPresenceDetector sender)
    {
        StartCoroutine("PlayerPresenceReaction");
    }

    public override void OnPlayerPresenceLost(PlayerPresenceDetector sender)
    {
        StopCoroutine("PlayerPresenceReaction");
    }

    public IEnumerator PlayerPresenceReaction()
    {
        while (true)
        {
            transform.Rotate(Vector3.up, c_RotationSpeed * (float)MiddleVR.VRKernel.GetDeltaTime(), Space.World);

            yield return null;
        }
    }
}
