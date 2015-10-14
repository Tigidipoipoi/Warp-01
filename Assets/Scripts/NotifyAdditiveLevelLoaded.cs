using UnityEngine;

public class NotifyAdditiveLevelLoaded : MonoBehaviour
{
    void Start()
    {
        ChangeSceneManager.GetInstance.ChangeLastLevelLoaded(gameObject);
    }
}
