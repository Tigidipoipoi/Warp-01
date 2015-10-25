using UnityEngine;

public class NotifyAdditiveLevelLoaded : MonoBehaviour
{
    public bool m_IsFullLevel = true;
    public int m_LevelIndex;

    void Awake()
    {
        if (ChangeSceneManager.GetInstance != null)
        {
            ChangeSceneManager.GetInstance.ChangeLastLevelLoaded(this);
        }
    }
}
