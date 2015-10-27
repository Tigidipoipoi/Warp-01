using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class WarpScript : MonoBehaviour
    {
        #region Members
        public bool m_UseDirectWarp;

        public WarpScript m_Destination;
        public Transform m_ShuttleWarpClampTransform;
        [HideInInspector]
        public ShuttleFeedbackScript m_ShuttleScript;
        public Renderer m_ParticleRenderer;

        [HideInInspector]
        public Material m_OriginalParticleMat;
        /// <summary>
        /// Used to highlight the active warp.
        /// </summary>
        public Material m_TriggeredParticleMat;
        /// <summary>
        /// Used to highlight the active warp's destination.
        /// </summary>
        public Material m_DestinationParticleMat;

        public float m_FadeTime = 0.75f;

        public float m_SmoothMoveTime = 3.0f;
        public vrTimer m_SmoothMoveTimer = new vrTimer();
        public Vector3 m_BeforePlayerPosition;
        public Quaternion m_BeforePlayerRotation;
        #endregion Members

        #region Unity events
        public void Start()
        {
            #region Check null members
            if (m_ParticleRenderer == null)
            {
                m_ParticleRenderer = transform.FindChild("Renderer")
                    .GetComponent<ParticleSystem>()
                    .GetComponent<Renderer>();
            }

            if (m_ParticleRenderer != null
                && m_OriginalParticleMat == null)
            {
                m_OriginalParticleMat = m_ParticleRenderer.material;
            }

            if (m_ShuttleWarpClampTransform == null)
            {
                if (transform.parent.GetComponent<ShuttleFeedbackScript>() != null)
                {
                    m_ShuttleWarpClampTransform = transform.parent;
                }
                else
                {
                    Debug.LogError("WarpScript::Start => No shuttle attached to the warp \"" + name + "\".");
                }
            }
            if (m_ShuttleWarpClampTransform != null)
            {
                m_ShuttleScript = m_ShuttleWarpClampTransform.GetComponent<ShuttleFeedbackScript>();
            }
            #endregion Check null members
        }

        #region Trigger events
        public void OnTriggerEnter(Collider enteringCollider)
        {
            if (enteringCollider.tag == Utils.Tags.Player)
            {
                ChangeParticleMaterial(m_TriggeredParticleMat);
                ActivateDestinationFeedBack();
                // We change the color of the warp destination.
                m_Destination.ChangeParticleMaterial(m_DestinationParticleMat);
            }
        }

        public void OnTriggerStay(Collider stayingCollider)
        {
            if (stayingCollider.tag == Utils.Tags.Player
                // Click wand's main button to warp in game.
                && (MiddleVR.VRDeviceMgr.IsWandButtonToggled(0)
#if UNITY_EDITOR
                // Double click to warp in editor mode.
                || Input.GetKeyUp(KeyCode.Space)
#endif
                ))
            {
                WarpToDestination();
            }
        }

        public void OnTriggerExit(Collider exitingCollider)
        {
            if (exitingCollider.tag == Utils.Tags.Player)
            {
                ChangeParticleMaterial(m_OriginalParticleMat);
                ActivateDestinationFeedBack(false);
                // We change the color of the warp destination.
                m_Destination.ChangeParticleMaterial(m_OriginalParticleMat);
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
                Debug.LogError("WarpScript::WarpToDestination => The warp \"" + name + "\" don't have any destination set.");
                return;
            }

            if (m_UseDirectWarp)
            {
                StartCoroutine("DirectWarp");
            }
            else
            {
                StartCoroutine("SmoothWarp");
            }
        }

        #region Direct warp
        public IEnumerator DirectWarp()
        {
            yield return CameraEffectsManager.GetInstance.StartCoroutine("IncreaseBlur", m_FadeTime);

            MVRCameraUtils.GetInstance.p_ShuttleContainer.position = m_Destination.m_ShuttleWarpClampTransform.position;
            MVRCameraUtils.GetInstance.p_ShuttleContainer.rotation = m_Destination.m_ShuttleWarpClampTransform.rotation;

            yield return CameraEffectsManager.GetInstance.StartCoroutine("DecreaseBlur", m_FadeTime);
        }
        #endregion Direct warp

        #region Smooth warp
        public IEnumerator SmoothWarp()
        {
            m_BeforePlayerPosition = MVRCameraUtils.GetInstance.p_ShuttleContainer.position;
            m_BeforePlayerRotation = MVRCameraUtils.GetInstance.p_ShuttleContainer.rotation;
            m_SmoothMoveTimer.Reset();
            while ((float)m_SmoothMoveTimer.seconds() < m_SmoothMoveTime)
            {
                SmoothMove();
                yield return null;
            }
            MVRCameraUtils.GetInstance.p_ShuttleContainer.position = m_Destination.m_ShuttleWarpClampTransform.position;
            MVRCameraUtils.GetInstance.p_ShuttleContainer.rotation = m_Destination.m_ShuttleWarpClampTransform.rotation;
        }

        private void SmoothMove()
        {
            Vector3 moveDistance = m_Destination.m_ShuttleWarpClampTransform.position - m_BeforePlayerPosition;
            //float moveAngle = Quaternion.Angle(m_Destination.m_ShuttleWarpClampTransform.rotation, m_BeforePlayerRotation);

            float theRatio = Mathf.PI / m_SmoothMoveTime * (float)m_SmoothMoveTimer.seconds();
            theRatio = theRatio - (Mathf.PI * 0.5f);
            theRatio = Mathf.Sin(theRatio);
            theRatio = (theRatio + 1) * 0.5f;

            moveDistance = moveDistance * theRatio;
            MVRCameraUtils.GetInstance.p_ShuttleContainer.position = m_BeforePlayerPosition + moveDistance;
            MVRCameraUtils.GetInstance.p_ShuttleContainer.rotation = Quaternion.Slerp(m_BeforePlayerRotation, m_Destination.m_ShuttleWarpClampTransform.transform.rotation, theRatio);
        }
        #endregion Smooth warp

        public void ActivateDestinationFeedBack(bool activate = true)
        {
            if (m_Destination == null)
            {
                Debug.LogWarning("WarpScript::ActivateDestinationFeedBack => The warp \"" + name + "\" don't have any destination set.");
                return;
            }

            if (m_Destination.m_ShuttleScript == null)
            {
                Debug.LogWarning("WarpScript::ActivateDestinationFeedBack => The destination warp \"" + name + "\" don't have any shuttleScript set.");
                return;
            }

            m_Destination.m_ShuttleScript.EnableFeedBack(activate);
        }
    }
}
