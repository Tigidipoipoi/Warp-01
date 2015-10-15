using System.Collections;
using UnityEngine;

public class ManagerSceneChange : MonoBehaviour
{
    #region Singleton
    static private ManagerSceneChange s_Instance;
    static public ManagerSceneChange GetInstance
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

    #region Members
    // We avoid to reload the "ManagersScene"
    public int m_StartLevelIndex = 1;
    public int m_MaxLevelIndex;
    #endregion Members

    public void Start()
    {
        m_MaxLevelIndex = Application.levelCount - 1;
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr != null)
        {
            if (MiddleVR.VRDeviceMgr.IsWandButtonPressed(5)
                || Input.GetKeyUp(KeyCode.RightArrow))
            {
                int newLevelIndex = Utils.GetNearestNeighbourIndex(
                    Application.loadedLevel, m_MaxLevelIndex, m_StartLevelIndex, true);

                Application.LoadLevel(newLevelIndex);

                Debug.Log("Poïnk " + newLevelIndex.ToString());
            }
            else if (MiddleVR.VRDeviceMgr.IsWandButtonPressed(4)
                || Input.GetKeyUp(KeyCode.LeftArrow))
            {
                int newLevelIndex = Utils.GetNearestNeighbourIndex(
                    Application.loadedLevel, m_MaxLevelIndex, m_StartLevelIndex, false);

                Application.LoadLevel(newLevelIndex);

                Debug.Log("Poïnk " + newLevelIndex.ToString());
            }
        }
    }
}
