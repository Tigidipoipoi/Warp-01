using UnityEngine;
using UnityEngine.UI;
using System.Collections;

namespace Warp01
{
    public class FakeWandMovement : MonoBehaviour
    {
        #region Members
        public Transform m_WandTransform;
        public string m_MoveWandButton = "MoveWand";
        public string m_RotateWandButton = "RotateWand";
        public string m_DisplayWandButton = "DisplayWand";
        public string m_ResetWandButton = "Reset";

        public bool m_WandIsDisplayed;
        public bool m_WandIsMoving;
        public bool m_WandIsRotating;

        private float m_TriggerAxisValue;

        // public const float c_WandLocalDepth = 0.3f;
        public float c_MinHorizontalValue = -0.55f;
        public float c_MaxHorizontalValue = 0.35f;
        public float c_MinVerticalValue = -0.15f;
        public float c_MaxVerticalValue = 0.35f;
        public float c_RotationSpeed = 45.0f;

        private Vector3 m_OriginalWandLocalPosition;
        private Quaternion m_OriginalWandLocalRotation;
        #endregion Members

        public void Start()
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;

            m_WandTransform = MVRCameraUtils.GetInstance.p_WandTransform;
            StartCoroutine("LaunchLevel");
            m_OriginalWandLocalPosition = m_WandTransform.localPosition;
            m_OriginalWandLocalRotation = m_WandTransform.localRotation;
        }

        public void Update()
        {
            m_TriggerAxisValue = Input.GetAxis("XBOXControllerTriggers");

            // Display Wand.
            if (Input.GetButtonDown(m_DisplayWandButton))
            {
                DisplayWand(!m_WandIsDisplayed);
            }

            // Move Wand.
            if (Input.GetButtonDown(m_MoveWandButton))
            {
                StopCoroutine("MoveWand");
                StartCoroutine("MoveWand");
            }
            else if (!m_WandIsMoving
                && m_TriggerAxisValue > 0.0f)
            {
                StopCoroutine("MoveWand");
                StartCoroutine("MoveWand");
            }

            // Rotate Wand.
            if (Input.GetButtonDown(m_RotateWandButton))
            {
                StopCoroutine("RotateWand");
                StartCoroutine("RotateWand");
            }
            else if (!m_WandIsRotating
                && m_TriggerAxisValue < 0.0f)
            {
                StopCoroutine("RotateWand");
                StartCoroutine("RotateWand");
            }

            // Reset Wand.
            if (Input.GetButtonUp(m_ResetWandButton))
            {
                ResetWandTransform();
            }
        }

        public IEnumerator MoveWand()
        {
            m_WandIsMoving = true;

            float horizontalDelta;
            float verticalDelta;
            Vector3 newWandLocalPosition;

            bool oldWandIsDisplay = m_WandIsDisplayed;
            DisplayWand(true);

            while (Input.GetButton(m_MoveWandButton)
                || m_TriggerAxisValue > 0.0f)
            {
                horizontalDelta = MiddleVR.VRDeviceMgr.GetMouseAxisValue(0);
                if (horizontalDelta.IsNearlyEqualTo(0.0f))
                {
                    horizontalDelta = Input.GetAxis("XBOXControllerRightStick-X");
                }

                verticalDelta = -MiddleVR.VRDeviceMgr.GetMouseAxisValue(1);
                if (verticalDelta.IsNearlyEqualTo(0.0f))
                {
                    verticalDelta = -Input.GetAxis("XBOXControllerRightStick-Y");
                }

                newWandLocalPosition = m_WandTransform.localPosition;
                newWandLocalPosition.x = Mathf.Clamp(newWandLocalPosition.x + horizontalDelta * Time.deltaTime, c_MinHorizontalValue, c_MaxHorizontalValue);
                newWandLocalPosition.y = Mathf.Clamp(newWandLocalPosition.y + verticalDelta * Time.deltaTime, c_MinVerticalValue, c_MaxVerticalValue);

                m_WandTransform.localPosition = newWandLocalPosition;

                yield return null;
            }

            DisplayWand(oldWandIsDisplay);
            m_WandIsMoving = false;
        }

        public IEnumerator RotateWand()
        {
            m_WandIsRotating = true;

            float horizontalDelta;
            float verticalDelta;

            bool oldWandIsDisplay = m_WandIsDisplayed;
            DisplayWand(true);

            while (Input.GetButton(m_RotateWandButton)
                || m_TriggerAxisValue < 0.0f)
            {
                horizontalDelta = MiddleVR.VRDeviceMgr.GetMouseAxisValue(0);
                if (horizontalDelta.IsNearlyEqualTo(0.0f))
                {
                    horizontalDelta = Input.GetAxis("XBOXControllerRightStick-X");
                }

                verticalDelta = -MiddleVR.VRDeviceMgr.GetMouseAxisValue(1);
                if (verticalDelta.IsNearlyEqualTo(0.0f))
                {
                    verticalDelta = -Input.GetAxis("XBOXControllerRightStick-Y");
                }

                m_WandTransform.Rotate(Vector3.up, horizontalDelta * c_RotationSpeed * Time.deltaTime, Space.World);
                m_WandTransform.Rotate(Vector3.left, verticalDelta * c_RotationSpeed * Time.deltaTime, Space.Self);

                yield return null;
            }

            DisplayWand(oldWandIsDisplay);

            m_WandIsRotating = false;
        }

        public void DisplayWand(bool display = true)
        {
            WandIndicateManager.TheWand.Show(display);
            m_WandIsDisplayed = display;
        }

        public IEnumerator LaunchLevel()
        {
            yield return new WaitForSeconds(0.5f);

            ChangeSceneManager.GetInstance.LoadNeighbourLevel(true);
        }

        public void ResetWandTransform()
        {
            m_WandTransform.localPosition = m_OriginalWandLocalPosition;
            m_WandTransform.localRotation = m_OriginalWandLocalRotation;
        }
    }
}