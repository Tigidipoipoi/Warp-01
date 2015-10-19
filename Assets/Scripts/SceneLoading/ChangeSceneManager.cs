using UnityEngine;
using System.Collections.Generic;

public class ChangeSceneManager : MonoBehaviour
{
    #region Singleton
    static private ChangeSceneManager s_Instance;
    static public ChangeSceneManager GetInstance
    {
        get
        {
            return s_Instance;
        }
    }

    void Awake()
    {
        if (s_Instance == null)
        {
            s_Instance = this;
        }
        DontDestroyOnLoad(this);
    }
    #endregion

    public delegate void DestroyLastLevelLoadedHandler();
    public event DestroyLastLevelLoadedHandler OnDestroyLastLevelLoaded;

    #region Members
    public bool m_LoadAsync;

    // We avoid to reload the "ManagersScene"
    public int m_StartLevelIndex = 1;
    public int m_MaxLevelIndex;
    public int m_LastLevelIndex;

    public Stack<NotifyAdditiveLevelLoaded> m_LastLevelLoadedStack;
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_MaxLevelIndex = Application.levelCount - 1;
        m_LastLevelLoadedStack = new Stack<NotifyAdditiveLevelLoaded>();
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr != null)
        {
            bool loadNextLevel = MiddleVR.VRDeviceMgr.IsWandButtonToggled(5)
                || Input.GetKeyUp(KeyCode.RightArrow);
            bool loadPreviousLevel = MiddleVR.VRDeviceMgr.IsWandButtonToggled(4)
                || Input.GetKeyUp(KeyCode.LeftArrow);

            if (loadNextLevel
                || loadPreviousLevel)
            {
                LoadNeighbourLevel(loadNextLevel);
            }
        }
    }
    #endregion Unity Events

    /// <summary>
    /// </summary>
    /// <param name="loadNextLevel">If true loads next level; loads previous otherwise.</param>
    public void LoadNeighbourLevel(bool loadNextLevel)
    {
        int newLevelIndex;

        if (loadNextLevel)
        {
            newLevelIndex = Utils.GetNearestNeighbourIndex(
                m_LastLevelIndex, m_MaxLevelIndex, m_StartLevelIndex, true);
        }
        else
        {
            newLevelIndex = Utils.GetNearestNeighbourIndex(
                m_LastLevelIndex, m_MaxLevelIndex, m_StartLevelIndex, false);
        }

        if (m_LoadAsync)
        {
            Application.LoadLevelAdditiveAsync(newLevelIndex);
        }
        else
        {
            Application.LoadLevelAdditive(newLevelIndex);
        }
    }

    public void ChangeLastLevelLoaded(NotifyAdditiveLevelLoaded loadedLevelContainer)
    {
        if (loadedLevelContainer.m_IsFullLevel
            || m_LastLevelLoadedStack.Peek().m_IsFullLevel)
        {
            DestroyOtherLevelLoaded();
        }

        m_LastLevelLoadedStack.Push(loadedLevelContainer);
        m_LastLevelIndex = loadedLevelContainer.m_LevelIndex;
    }

    public void DestroyOtherLevelLoaded()
    {
        if (m_LastLevelLoadedStack == null
            || m_LastLevelLoadedStack.Count == 0)
        {
            return;
        }

        // Event
        if (OnDestroyLastLevelLoaded != null)
        {
            OnDestroyLastLevelLoaded();
        }

        while (m_LastLevelLoadedStack.Count > 0)
        {
            Destroy(m_LastLevelLoadedStack.Pop().gameObject);
        }
        Resources.UnloadUnusedAssets();
    }
}
