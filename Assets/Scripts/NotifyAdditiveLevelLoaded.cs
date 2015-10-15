using UnityEngine;

public class NotifyAdditiveLevelLoaded : MonoBehaviour
{
    public int m_LevelIndex;

    void Start()
    {
        ChangeSceneManager.GetInstance.ChangeLastLevelLoaded(this);
    }
}
