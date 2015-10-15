using System.Collections;
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
    public const int c_StartIterations = 0;
    public const int c_MaxIterations = 10;
    public vrTimer m_FadeTimer = new vrTimer();

    public void Start()
    {
        m_CameraBlurs = new Blur[MVRCameraUtils.GetInstance.p_AllCameras.Length];

        for (int i = 0; i < MVRCameraUtils.GetInstance.p_AllCameras.Length; ++i)
        {
            m_CameraBlurs[i] = MVRCameraUtils.GetInstance.p_AllCameras[i].GetComponent<Blur>();
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

    private IEnumerator IncreaseBlur(float fadeTime)
    {
        EnableBlurs();

        m_FadeTimer.Reset();
        while (fadeTime - (float)m_FadeTimer.seconds() > 0.0f)
        {
            float elapsedTimeRate = Mathf.Clamp((float)m_FadeTimer.seconds() / fadeTime, 0.0f, 1.0f);
            SetBlurIteration((int)Mathf.Lerp(c_StartIterations, c_MaxIterations, elapsedTimeRate));

            yield return null;
        }
    }

    private IEnumerator DecreaseBlur(float fadeTime)
    {
        m_FadeTimer.Reset();
        while (fadeTime - (float)m_FadeTimer.seconds() > 0.0f)
        {
            float elapsedTimeRate = Mathf.Clamp((float)m_FadeTimer.seconds() / fadeTime, 0.0f, 1.0f);
            SetBlurIteration((int)Mathf.Lerp(c_MaxIterations, c_StartIterations, elapsedTimeRate));
            yield return null;
        }

        EnableBlurs(false);
    }
}