using UnityEngine;

public class managerPattern : MonoBehaviour {
    #region Singleton
    static private managerPattern s_Instance;
    static public managerPattern GetInstance {
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

}
