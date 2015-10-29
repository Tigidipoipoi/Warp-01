using UnityEngine;
using System.Collections;

[RequireComponent(typeof(PlayerPresenceDetector))]
public abstract class PlayerPresenceReactingScript : MonoBehaviour
{
    #region Members
    protected PlayerPresenceDetector m_PlayerPresenceDetector;
    #endregion Members

    public virtual void Start()
    {
        m_PlayerPresenceDetector = GetComponent<PlayerPresenceDetector>();
        m_PlayerPresenceDetector.OnPlayerPresenceDetected += OnPlayerPresenceDetected;
        m_PlayerPresenceDetector.OnPlayerPresenceLost += OnPlayerPresenceLost;
    }

    public abstract void OnPlayerPresenceDetected(PlayerPresenceDetector sender);

    public abstract void OnPlayerPresenceLost(PlayerPresenceDetector sender);
}
