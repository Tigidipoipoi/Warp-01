using UnityEngine;

/// <summary>
/// This class regroups a bunch of usefull stuff for interacting with cameras.
/// </summary>
public class MVRCameraUtils : MonoBehaviour
{
    #region Singleton
    static private MVRCameraUtils s_Instance;
    static public MVRCameraUtils GetInstance
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
    public const int c_NonStereoCameraNumber = 8;

    #region Cameras' name
    public string c_StereoCamFront = "CameraStereo_Front";
    public string c_StereoCamFloor = "CameraStereo_Floor";
    public string c_StereoCamLeft = "CameraStereo_Left";
    public string c_StereoCamRight = "CameraStereo_Right";

    public string c_CamSuffixLeft = ".Left";
    public string c_CamSuffixRight = ".Right";
    #endregion Cameras' name

    #region Front camera
    /// <summary>
    /// Cached value for <see cref="p_CameraStereoFront"/>.
    /// </summary>
    private GameObject m_CameraStereoFront;
    public GameObject p_CameraStereoFront
    {
        get
        {
            if (m_CameraStereoFront == null
                && MiddleVR.VRDisplayMgr != null)
            {
                m_CameraStereoFront = GetCameraGameObject(c_StereoCamFront);
            }

            return m_CameraStereoFront;
        }
    }
    #endregion Front camera

    #region Floor camera
    /// <summary>
    /// Cached value for <see cref="p_CameraStereoFloor"/>.
    /// </summary>
    private GameObject m_CameraStereoFloor;
    public GameObject p_CameraStereoFloor
    {
        get
        {
            if (m_CameraStereoFloor == null
                && MiddleVR.VRDisplayMgr != null)
            {
                m_CameraStereoFloor = GetCameraGameObject(c_StereoCamFloor);
            }

            return m_CameraStereoFloor;
        }
    }
    #endregion Floor camera

    #region Left Camera
    /// <summary>
    /// Cached value for <see cref="p_CameraStereoLeft"/>.
    /// </summary>
    private GameObject m_CameraStereoLeft;
    public GameObject p_CameraStereoLeft
    {
        get
        {
            if (m_CameraStereoLeft == null
                && MiddleVR.VRDisplayMgr != null)
            {
                m_CameraStereoLeft = GetCameraGameObject(c_StereoCamLeft);
            }

            return m_CameraStereoLeft;
        }
    }
    #endregion Left Camera

    #region Right Camera
    /// <summary>
    /// Cached value for <see cref="p_CameraStereoRight"/>.
    /// </summary>
    private GameObject m_CameraStereoRight;
    public GameObject p_CameraStereoRight
    {
        get
        {
            if (m_CameraStereoRight == null
                && MiddleVR.VRDisplayMgr != null)
            {
                m_CameraStereoRight = GetCameraGameObject(c_StereoCamRight);
            }

            return m_CameraStereoRight;
        }
    }
    #endregion Right Camera

    /// <summary>
    /// Get the player position and rotation.
    /// </summary>
    public Transform p_PlayerTransform
    {
        get
        {
            if (p_CameraStereoFront == null)
            {
                return null;
            }

            return p_CameraStereoFront.transform;
        }
    }

    /// <summary>
    /// Cached value for <see cref="p_ShuttleContainer"/>.
    /// </summary>
    private Transform m_ShuttleContainer;
    public Transform p_ShuttleContainer
    {
        get
        {
            if (m_ShuttleContainer == null)
            {
                GameObject shuttleContainerGO = GameObject.FindGameObjectWithTag("Shuttle");

                if (shuttleContainerGO == null)
                {
                    return null;
                }

                m_ShuttleContainer = shuttleContainerGO.transform;
            }

            return m_ShuttleContainer;
        }
    }

    /// <summary>
    /// Cached value for <see cref=""/>.
    /// </summary>
    private Camera[] m_AllCameras;
    public Camera[] p_AllCameras
    {
        get
        {
            if (m_AllCameras == null)
            {
                if (p_CameraStereoFloor == null
                    || p_CameraStereoFront == null
                    || p_CameraStereoLeft == null
                    || p_CameraStereoRight == null)
                {
                    return new Camera[0];
                }

                m_AllCameras = new Camera[c_NonStereoCameraNumber];

                m_AllCameras[0] = GetCameraGameObject(c_StereoCamFront + c_CamSuffixLeft).GetComponent<Camera>();
                m_AllCameras[1] = GetCameraGameObject(c_StereoCamFront + c_CamSuffixRight).GetComponent<Camera>();
                m_AllCameras[2] = GetCameraGameObject(c_StereoCamFloor + c_CamSuffixLeft).GetComponent<Camera>();
                m_AllCameras[3] = GetCameraGameObject(c_StereoCamFloor + c_CamSuffixRight).GetComponent<Camera>();
                m_AllCameras[4] = GetCameraGameObject(c_StereoCamLeft + c_CamSuffixLeft).GetComponent<Camera>();
                m_AllCameras[5] = GetCameraGameObject(c_StereoCamLeft + c_CamSuffixRight).GetComponent<Camera>();
                m_AllCameras[6] = GetCameraGameObject(c_StereoCamRight + c_CamSuffixLeft).GetComponent<Camera>();
                m_AllCameras[7] = GetCameraGameObject(c_StereoCamRight + c_CamSuffixRight).GetComponent<Camera>();
            }

            return m_AllCameras;
        }
    }
    #endregion Members

    private GameObject GetCameraGameObject(string cameraName)
    {
        return GameObject.Find(MiddleVR.VRDisplayMgr.GetCamera(cameraName).GetName());
    }
}
