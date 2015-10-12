using UnityEngine;

namespace Warp01
{
    public class WarpScript : MonoBehaviour
    {
        #region Members
        public WarpScript m_Destination;
        public Transform m_ShuttleTransform;
        public Renderer m_ParticleRenderer;

        [HideInInspector]
        public Material m_OriginalParticleMat;
        public Material m_TriggeredParticleMat;

        public GameObject m_PlayerStartPosition;
        #endregion Members

        #region Unity events
        public void Start()
        {
            Utils.ClearLog();

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
        }

        #region Trigger events
        public void OnTriggerEnter(Collider enteringCollider)
        {
            if (enteringCollider.tag == "Player")
            {
                Debug.Log("Player entered Warp.");
                ChangeParticleMaterial(m_TriggeredParticleMat);
            }
        }

        public void OnTriggerStay(Collider stayingCollider)
        {
            if (stayingCollider.tag == "Player"
#if UNITY_EDITOR
                // Double click to warp in editor mode.
                && MiddleVR.VRDeviceMgr.IsMouseButtonToggled(0))
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
                Debug.Log("Player exited Warp.");
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

            m_PlayerStartPosition.transform.position = m_Destination.m_ShuttleTransform.position;
            m_PlayerStartPosition.transform.rotation = m_Destination.m_ShuttleTransform.rotation;
        }
    }
}
