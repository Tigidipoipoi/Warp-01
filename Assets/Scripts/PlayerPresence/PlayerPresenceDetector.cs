using UnityEngine;
using System.Collections;

[RequireComponent(typeof(CapsuleCollider))]
public class PlayerPresenceDetector : MonoBehaviour
{
    #region Events
    public delegate void PlayerPresenceDetectedHandler(PlayerPresenceDetector sender);
    public event PlayerPresenceDetectedHandler OnPlayerPresenceDetected;
    public delegate void PlayerPresenceLostHandler(PlayerPresenceDetector sender);
    public event PlayerPresenceLostHandler OnPlayerPresenceLost;
    #endregion Events

    #region Members
    public CapsuleCollider m_Trigger;
    #endregion Members

    public void Start()
    {
        m_Trigger = GetComponent<CapsuleCollider>();
        m_Trigger.isTrigger = true;
    }

    public void OnTriggerEnter(Collider enteringCollider)
    {
        if (enteringCollider.tag == Utils.Tags.Player)
        {
            if (OnPlayerPresenceDetected != null)
            {
                OnPlayerPresenceDetected(this);
            }
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == Utils.Tags.Player)
        {
            if (OnPlayerPresenceLost != null)
            {
                OnPlayerPresenceLost(this);
            }
        }
    }
}
