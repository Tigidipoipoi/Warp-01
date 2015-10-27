using UnityEngine;
using System.Collections;

public class MoveCarpetArrowScript : MonoBehaviour
{
    public e_Directions m_Direction;
    public MoveCarpetScript m_MoveCarpetScript;

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
            m_MoveCarpetScript.StartMoveShuttleInDirection(m_Direction);
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == Utils.Tags.Player)
        {
            m_MoveCarpetScript.StopMoveShuttleInDirection();
        }
    }
}