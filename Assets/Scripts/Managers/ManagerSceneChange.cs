using UnityEngine;

public class ManagerSceneChange : MonoBehaviour {
    #region Singleton
    static private ManagerSceneChange s_Instance;
    static public ManagerSceneChange GetInstance {
        get {
            return s_Instance;
        }
    }

    void Awake () {
        if (s_Instance == null) {
            s_Instance = this;
		}
        DontDestroyOnLoad (this);
    }
    #endregion

    void Update()
    {
        if (MiddleVR.VRDeviceMgr.IsWandButtonPressed(1) || Input.GetKeyDown(KeyCode.RightArrow))
        {
            Application.LoadLevel((Application.loadedLevel + 1) % Application.levelCount);
        }
    }

}
