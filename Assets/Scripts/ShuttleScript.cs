using UnityEngine;

public class ShuttleScript : MonoBehaviour
{
    public Projector m_FeedBackProjector;

    public void Start()
    {
        if (m_FeedBackProjector == null)
        {
            m_FeedBackProjector = transform.GetComponentInChildren<Projector>();
        }
        EnableFeedBackProjector(false);
    }

    public void EnableFeedBackProjector(bool enable = true)
    {
        if (m_FeedBackProjector == null)
        {
            Debug.LogError("ShuttleScript::EnableFeedBackProjector => No feedback projector is attached to the shuttle \"" + name + "\".");
            return;
        }

        m_FeedBackProjector.enabled = enable;
    }
}