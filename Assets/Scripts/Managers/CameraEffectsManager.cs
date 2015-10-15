using UnityEngine;
using UnityStandardAssets.ImageEffects;

public class CameraEffectsManager : MonoBehaviour
{
    #region Singleton
    static private CameraEffectsManager s_Instance;
    static public CameraEffectsManager GetInstance
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

    public Blur[] m_CameraBlurs;

    public void Start()
    {
        Camera[] cameras = Camera.allCameras;
        m_CameraBlurs = new Blur[cameras.Length];

        for (int i = 0; i < cameras.Length; ++i)
        {
            m_CameraBlurs[i] = cameras[i].GetComponent<Blur>();
        }

        EnableBlurs(false);
    }

    public void SetBlurIteration(int iterations)
    {
        if (m_CameraBlurs == null
            || m_CameraBlurs.Length < 0)
        {
            return;
        }

        foreach (Blur cameraBlur in m_CameraBlurs)
        {
            cameraBlur.iterations = iterations;
        }
    }

    public void EnableBlurs(bool enable = true)
    {
        if (m_CameraBlurs == null
            || m_CameraBlurs.Length < 0)
        {
            return;
        }

        foreach (Blur cameraBlur in m_CameraBlurs)
        {
            cameraBlur.enabled = enable;
        }
    }
}