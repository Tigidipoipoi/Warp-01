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
    /// <summary>
    /// Cached value for <see cref="p_PlayerTransform"/>.
    /// </summary>
    private Transform m_PlayerTransform;
    /// <summary>
    /// Get the player position and rotation.
    /// </summary>
    public Transform p_PlayerTransform
    {
        get
        {
            if (m_PlayerTransform == null)
            {
                GameObject playerGO = GameObject.FindGameObjectWithTag("Player");
                if (playerGO == null)
                {
                    m_PlayerTransform = null;
                }

                m_PlayerTransform = playerGO.transform;
            }

            return m_PlayerTransform;
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
    public Camera[] m_AllCameras;
    public Camera[] p_AllCameras
    {
        get
        {
            if (m_AllCameras == null
                || m_AllCameras.Length < 1)
            {
                // We substract the server's camera.
                uint vrCamNumber = MiddleVR.VRDisplayMgr.GetCamerasNb() - 1;
                int unityCamNumber = (int)vrCamNumber / 3 * 2;
                m_AllCameras = new Camera[unityCamNumber];

                for (uint i = 0, j = 0; i < vrCamNumber; i += 3, j += 2)
                {
                    // Left Cam
                    vrCamera leftVRCam = MiddleVR.VRDisplayMgr.GetCamera(i + 1);
                    GameObject leftCamGO = GameObject.Find(leftVRCam.GetName());
                    m_AllCameras[j] = leftCamGO.GetComponent<Camera>();

                    // Right Cam
                    vrCamera rightVRCam = MiddleVR.VRDisplayMgr.GetCamera(i + 2);
                    GameObject rightCamGO = GameObject.Find(rightVRCam.GetName());
                    m_AllCameras[j + 1] = rightCamGO.GetComponent<Camera>();
                }
            }

            return m_AllCameras;
        }
    }
    #endregion Members

    private GameObject GetCameraGameObject(string cameraName)
    {
        return GameObject.Find(MiddleVR.VRDisplayMgr.GetCamera(cameraName).GetName());
    }

    /// <summary>
    /// </summary>
    /// <param name="newPosition"></param>
    /// <param name="additive">If true will add <paramref name="newPosition"/> to the current shuttle's position.</param>
    public void SetShuttlePosition(Vector3 newPosition, bool additive = false)
    {
        if (p_ShuttleContainer == null)
        {
            return;
        }

        if (additive)
        {
            m_ShuttleContainer.transform.position += newPosition;
        }
        else
        {
            m_ShuttleContainer.transform.position = newPosition;
        }
    }
}
