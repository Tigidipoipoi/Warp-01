using UnityEngine;
using System.Collections;

public class SoundManager : MonoBehaviour
{
    #region Singleton
    static private SoundManager s_Instance;
    static public SoundManager GetInstance
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
    public AudioSource m_AudioSource;
    public AudioClip m_CantDisplayCarpetSound;
    #endregion Members

    public void Start()
    {
        m_AudioSource = GetComponent<AudioSource>();

        MoveCarpetScript.OnCantDisplayCarpet += new MoveCarpetScript.CantDisplayCarpetHandler(PlayCantDisplayCarpetSound);
    }

    public void Update()
    {
        if (Input.GetKeyUp(KeyCode.Space))
        {
            PlayCantDisplayCarpetSound();
        }
    }

    public void PlayCantDisplayCarpetSound()
    {
        PlaySound(m_CantDisplayCarpetSound);
    }

    public void PlaySound(AudioClip soundToPlay)
    {
        if (soundToPlay == null)
        {
            Debug.LogError("The clip you tried to play was null !");
            return;
        }

        m_AudioSource.clip = soundToPlay;
        m_AudioSource.Play();
    }
}