using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class FakeWandMovement : MonoBehaviour
    {
        #region Members
        public Transform m_WandTransform;
        public string m_MoveWandButton = "Fire1";
        public string m_RotateWandButton = "Fire2";
        public string m_DisplayWandButton = "Jump";
        public string m_ResetWandButton = "Reset";

        public bool m_WandIsDisplayed;

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
            m_WandTransform = MVRCameraUtils.GetInstance.p_WandTransform;
            StartCoroutine("LaunchLevel");
            m_OriginalWandLocalPosition = m_WandTransform.localPosition;
            m_OriginalWandLocalRotation = m_WandTransform.localRotation;
        }

        public void Update()
        {
            // Display Wand.
            if (Input.GetButtonDown(m_DisplayWandButton))
            {
                DisplayWand(!m_WandIsDisplayed);
            }

            // Move Wand.
            if (Input.GetButtonDown(m_MoveWandButton))
            {
                StartCoroutine("MoveWand");
            }

            // Rotate Wand.
            if (Input.GetButtonDown(m_RotateWandButton))
            {
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
            Vector3 previousMousePosition = Input.mousePosition;
            Vector3 currentMousePosition = Input.mousePosition;
            float horizontalDelta;
            float verticalDelta;
            Vector3 newWandLocalPosition;

            bool oldWandIsDisplay = m_WandIsDisplayed;
            DisplayWand(true);

            while (Input.GetButton(m_MoveWandButton))
            {
                currentMousePosition = Input.mousePosition;
                horizontalDelta = currentMousePosition.x - previousMousePosition.x;
                horizontalDelta /= Screen.width;
                verticalDelta = currentMousePosition.y - previousMousePosition.y;
                verticalDelta /= Screen.height;

                newWandLocalPosition = m_WandTransform.localPosition;
                newWandLocalPosition.x = Mathf.Clamp(newWandLocalPosition.x + horizontalDelta, c_MinHorizontalValue, c_MaxHorizontalValue);
                newWandLocalPosition.y = Mathf.Clamp(newWandLocalPosition.y + verticalDelta, c_MinVerticalValue, c_MaxVerticalValue);

                m_WandTransform.localPosition = newWandLocalPosition;

                yield return null;
                previousMousePosition = currentMousePosition;
            }

            DisplayWand(oldWandIsDisplay);
        }

        public IEnumerator RotateWand()
        {
            Vector3 previousMousePosition = Input.mousePosition;
            Vector3 currentMousePosition = Input.mousePosition;
            float horizontalDelta;
            float verticalDelta;

            bool oldWandIsDisplay = m_WandIsDisplayed;
            DisplayWand(true);

            while (Input.GetButton(m_RotateWandButton))
            {
                currentMousePosition = Input.mousePosition;
                horizontalDelta = currentMousePosition.x - previousMousePosition.x;
                horizontalDelta /= Screen.width;
                verticalDelta = currentMousePosition.y - previousMousePosition.y;
                verticalDelta /= Screen.height;

                m_WandTransform.Rotate(Vector3.up, horizontalDelta * c_RotationSpeed, Space.World);
                m_WandTransform.Rotate(Vector3.left, verticalDelta * c_RotationSpeed, Space.Self);

                yield return null;
                previousMousePosition = currentMousePosition;
            }

            DisplayWand(oldWandIsDisplay);
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