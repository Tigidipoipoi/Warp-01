using UnityEngine;
using System.Collections;

public abstract class CleanBehaviourOnDestroy : MonoBehaviour
{
    protected ChangeSceneManager.DestroyLastLevelLoadedHandler m_DestroyHandler;

    public virtual void Start()
    {
        // Prepare to clean on new scene load.
        m_DestroyHandler = new ChangeSceneManager.DestroyLastLevelLoadedHandler(Die);
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded += m_DestroyHandler;
    }

    public virtual void Die()
    {
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded -= m_DestroyHandler;
    }
}

