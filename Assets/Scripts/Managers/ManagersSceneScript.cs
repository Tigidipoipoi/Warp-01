using UnityEngine;

public class ManagersSceneScript : MonoBehaviour
{
    [Tooltip("The scene index to load. 1 is the next scene after this one.")]
    public int m_LevelIndexToLoad = 1;

    void Start()
    {
        Application.LoadLevel(m_LevelIndexToLoad);
    }
}
