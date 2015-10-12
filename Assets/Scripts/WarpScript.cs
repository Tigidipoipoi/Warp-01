using UnityEngine;
using System.Collections;
using UnityStandardAssets.ImageEffects;

namespace Warp01
{
    public class WarpScript : MonoBehaviour
    {
        #region Members
        public bool m_UseDirectWarp;

        public WarpScript m_Destination;
        public Transform m_ShuttleTransform;
        public Renderer m_ParticleRenderer;

        [HideInInspector]
        public Material m_OriginalParticleMat;
        public Material m_TriggeredParticleMat;

        public GameObject m_PlayerStartPosition;

        public int m_StartIterations = 0;
        public int m_MaxIterations = 10;
        public float m_FadeTime = 0.25f;
        public vrTimer m_FadeTimer = new vrTimer();
        public Blur[] m_CameraBlurs;
        #endregion Members

        #region Unity events
        public void Start()
        {
            if (m_ParticleRenderer == null)
            {
                m_ParticleRenderer = transform.FindChild("Renderer")
                    .GetComponent<ParticleSystem>()
                    .GetComponent<Renderer>();
            }

            if (m_ParticleRenderer != null)
            {
                m_OriginalParticleMat = m_ParticleRenderer.material;
            }

            if (m_PlayerStartPosition == null
                || m_PlayerStartPosition.tag != "Player")
            {
                m_PlayerStartPosition = GameObject.FindGameObjectWithTag("Player");
            }

            Camera[] cameras = Camera.allCameras;
            m_CameraBlurs = new Blur[cameras.Length];

            for (int i = 0; i < cameras.Length; ++i)
            {
                m_CameraBlurs[i] = cameras[i].GetComponent<Blur>();
            }

            EnableBlurs(false);
        }

        #region Trigger events
        public void OnTriggerEnter(Collider enteringCollider)
        {
            if (enteringCollider.tag == "Player")
            {
                Debug.Log("Player entered Warp \"" + name + "\".");
                ChangeParticleMaterial(m_TriggeredParticleMat);
            }
        }

        public void OnTriggerStay(Collider stayingCollider)
        {
            if (stayingCollider.tag == "Player"
#if UNITY_EDITOR
                // Double click to warp in editor mode.
                && Input.GetKeyUp(KeyCode.Space))
#else
                // Click wand's main button to warp in game.
                && MiddleVR.VRDeviceMgr.IsWandButtonPressed(0))
#endif
            {
                Debug.Log("Want to warp to " + m_Destination.name + ".");
                WarpToDestination();
            }
        }

        public void OnTriggerExit(Collider exitingCollider)
        {
            if (exitingCollider.tag == "Player")
            {
                Debug.Log("Player exited Warp \"" + name + "\".");
                ChangeParticleMaterial(m_OriginalParticleMat);
            }
        }
        #endregion Trigger events
        #endregion Unity events

        public void ChangeParticleMaterial(Material newMat)
        {
            if (m_ParticleRenderer == null)
            {
                Debug.LogError("WarpScript::ChangeParticleMaterial => The reference to the warp \"" + name + "\" particle system is missing.");
                return;
            }
            else if (newMat == null)
            {
                Debug.LogError("WarpScript::ChangeParticleMaterial => The new material you are trying to set is null.");
                return;
            }

            m_ParticleRenderer.material = newMat;
        }

        public void WarpToDestination()
        {
            if (m_Destination == null)
            {
                Debug.LogError("WarpScript::WarpToDestination => You don't have any destination set.");
                return;
            }

            if (m_UseDirectWarp)
            {
                StartCoroutine("DirectWarp");
            }
            else
            {
                SmoothWarp();
            }
        }

        public IEnumerator DirectWarp()
        {
            yield return StartCoroutine("FadeBeforeDirectWarp");

            m_PlayerStartPosition.transform.position = m_Destination.m_ShuttleTransform.position;
            m_PlayerStartPosition.transform.rotation = m_Destination.m_ShuttleTransform.rotation;

            yield return StartCoroutine("FadeAfterDirectWarp");
        }

        public void SmoothWarp()
        {

        }

        private IEnumerator FadeBeforeDirectWarp()
        {
            EnableBlurs();
            m_FadeTimer.Reset();
            while (m_FadeTime - (float)m_FadeTimer.seconds() > 0.0f)
            {
                float elapsedTimeRate = Mathf.Clamp((float)m_FadeTimer.seconds() / m_FadeTime, 0.0f, 1.0f);
                SetBlurIteration((int)Mathf.Lerp(m_StartIterations, m_MaxIterations, elapsedTimeRate));

                yield return null;
            }
        }

        private IEnumerator FadeAfterDirectWarp()
        {
            m_FadeTimer.Reset();
            while (m_FadeTime - (float)m_FadeTimer.seconds() > 0.0f)
            {
                float elapsedTimeRate = Mathf.Clamp((float)m_FadeTimer.seconds() / m_FadeTime, 0.0f, 1.0f);
                SetBlurIteration((int)Mathf.Lerp(m_MaxIterations, m_StartIterations, elapsedTimeRate));

                yield return null;
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
}
