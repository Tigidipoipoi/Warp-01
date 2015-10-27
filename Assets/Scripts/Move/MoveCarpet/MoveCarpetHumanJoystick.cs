using UnityEngine;

public class MoveCarpetHumanJoystick : MonoBehaviour
{
    public MoveCarpetScript m_MoveCarpetScript;

    #region Unity Events
    public void Start()
    {
        if (m_MoveCarpetScript == null)
        {
            m_MoveCarpetScript = transform.GetComponentInParent<MoveCarpetScript>();
        }
    }

    public void OnTriggerEnter(Collider enteringCollider)
    {
        if (enteringCollider.tag == Utils.Tags.Player)
        {
            m_MoveCarpetScript.StopMoveShuttleInDirection();
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == Utils.Tags.Player)
        {
            m_MoveCarpetScript.StartMoveShuttleInDirection();
        }
    }
    #endregion Unity Events
}
