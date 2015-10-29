using UnityEngine;
//using System.Collections;

public class PlayerPresenceGlitchScript : PlayerPresenceReactingScript
{
    public override void OnPlayerPresenceDetected(PlayerPresenceDetector sender)
    {
        Debug.Log("Player detected.");
    }

    public override void OnPlayerPresenceLost(PlayerPresenceDetector sender)
    {
        Debug.Log("Player lost.");
    }
}
