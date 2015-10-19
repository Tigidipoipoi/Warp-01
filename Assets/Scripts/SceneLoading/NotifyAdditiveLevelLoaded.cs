using UnityEngine;

public class NotifyAdditiveLevelLoaded : MonoBehaviour
{
    public bool m_IsFullLevel = true;
    public int m_LevelIndex;

    void Start()
    {
        ChangeSceneManager.GetInstance.ChangeLastLevelLoaded(this);
    }
}
