using UnityEngine;
using System.Linq;
using UnityStandardAssets.ImageEffects;

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
    /// Cached value for <see cref="p_WandTransform"/>.
    /// </summary>
    private Transform m_WandTransform;
    public Transform p_WandTransform
    {
        get
        {
            if (m_WandTransform == null)
            {
                GameObject wandGO = GameObject.FindGameObjectWithTag("Wand");

                if (wandGO == null)
                {
                    return null;
                }

                m_WandTransform = wandGO.transform;
            }

            return m_WandTransform;
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
                uint vrCamNumber = MiddleVR.VRDisplayMgr.GetCamerasNb();
                // A little security.
                int vrCamNumberMod3 = (int)vrCamNumber % 3;
                if (vrCamNumberMod3 != 0)
                {
                    vrCamNumber = vrCamNumber - (vrCamNumber % 3);
                }

                m_AllCameras = FindObjectsOfType<Camera>()
                    .Where(camera => camera.GetComponent<Blur>() != null)
                    .ToArray();
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
