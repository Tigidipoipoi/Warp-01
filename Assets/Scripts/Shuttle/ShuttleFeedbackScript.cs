using UnityEngine;

public class ShuttleFeedbackScript : MonoBehaviour
{
    public GameObject m_FeedBackGO;

    public void Start()
    {
        if (m_FeedBackGO == null)
        {
            Debug.LogWarning("ShuttleFeedbackScript::Start => No warp destination feedback for \"" + name + "\"!");
            Destroy(this);
        }
        EnableFeedBack(false);
    }

    public void EnableFeedBack(bool enable = true)
    {
        if (m_FeedBackGO == null)
        {
            Debug.LogWarning("ShuttleFeedbackScript::EnableFeedBackProjector => No feedback projector is attached to the shuttle \"" + name + "\".");
            return;
        }

        m_FeedBackGO.SetActive(enable);
    }
}