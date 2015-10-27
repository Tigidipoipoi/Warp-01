using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class WarpControllerManager : MonoBehaviour
    {

        public float m_MoveSpeed = 1;
        public float m_RotationalSpeed = 1;

        public GameObject m_BeforeWarp;
        public WarpScript m_BeforeWarpScript;
        public GameObject m_AfterWarp;
        public WarpScript m_AfterWarpScript;

        private bool isWarpPositionMove;
        private VRInteractionNavigationWandJoystick m_JoystickNavigation;

        #region Unity events
        // Use this for initialization
        void Start()
        {
            #region Check null members
            if (m_BeforeWarp == null || m_AfterWarp == null)
            {
                Debug.LogError("WarpManager::Start => No shuttle attached to the warp \"" + name + "\".");
            }
            #endregion Check null members

            isWarpPositionMove = false;
            m_AfterWarp.SetActive(false);

            m_JoystickNavigation = FindObjectOfType<VRInteractionNavigationWandJoystick>();
            m_JoystickNavigation.EnableTranslation(false);
        }

        // Update is called once per frame
        void Update()
        {
            if (!isWarpPositionMove && EnterButtonCheck())
            {
                isWarpPositionMove = true;
                WarpControlle();
            }
        }
        #endregion Unity events

        #region WarpControlle
        public void WarpControlle()
        {
            StartCoroutine("ShiftWarpPosition");
        }

        public IEnumerator ShiftWarpPosition()
        {
            m_BeforeWarp.transform.position = m_AfterWarp.transform.position;
            m_BeforeWarp.transform.rotation = m_AfterWarp.transform.rotation;

            yield return null;

            bool move = true;
            bool rotate = true;
            m_AfterWarp.SetActive(true);

            while (move)
            {
                if (EnterButtonCheck())
                {
                    move = false;
                }
                if (CancelButtonCheck())
                {
                    ShiftWarpEnd(true);
                    yield break;
                }

                float x = 0f;
                float y = 0f;
                x = MiddleVR.VRDeviceMgr.GetWandHorizontalAxisValue();
                y = MiddleVR.VRDeviceMgr.GetWandVerticalAxisValue();
                Vector3 direction = new Vector3(x, 0, y);

                m_AfterWarp.transform.position += m_AfterWarp.transform.rotation * (direction * m_MoveSpeed * 0.1f);

                yield return null;
            }

            while (rotate)
            {
                if (EnterButtonCheck())
                {
                    rotate = false;
                }
                if (CancelButtonCheck())
                {
                    ShiftWarpEnd(true);
                    yield break;
                }

                float angleRatio = MiddleVR.VRDeviceMgr.GetWandHorizontalAxisValue();
                m_AfterWarp.transform.rotation *= Quaternion.AngleAxis(angleRatio * m_RotationalSpeed, Vector3.up);
                yield return null;
            }

            ShiftWarpEnd();
            m_BeforeWarpScript.WarpToDestination();

        }

        public bool EnterButtonCheck()
        {
            if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(0, false))
            {
                return true;
            }

            return false;
        }

        public bool CancelButtonCheck()
        {
            if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(1, false))
            {
                return true;
            }
            return false;
        }

        public void ShiftWarpEnd(bool cancel = false)
        {
            if (cancel)
            {
                m_AfterWarp.transform.position = m_BeforeWarp.transform.position;
                m_AfterWarp.transform.rotation = m_BeforeWarp.transform.rotation;
            }

            m_AfterWarp.SetActive(false);
            isWarpPositionMove = false;
        }
        #endregion WarpControle

        void OnDestroy()
        {
            m_JoystickNavigation.EnableRotation(true);
            m_JoystickNavigation.EnableTranslation(true);
        }
    }
}