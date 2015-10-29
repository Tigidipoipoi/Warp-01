using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class WandIndicateManager : MonoBehaviour
    {
        #region Members
        private static VRWand theWand;
        private static VRSelectionManager theSelectionManager;

        public static VRWand TheWand
        {
            get
            {
                if (theWand == null)
                {
                    theWand = (VRWand)FindObjectOfType(typeof(VRWand));

                    if (theWand == null)
                    {
                        Debug.LogError("An instance of " + typeof(VRWand) + " is needed in the scene, but there is none.");
                    }
                }
                return theWand;
            }
        }
        public static VRSelectionManager TheSelectionManager
        {
            get
            {
                if (theSelectionManager == null)
                {
                    theSelectionManager = (VRSelectionManager)FindObjectOfType(typeof(VRSelectionManager));

                    if (theSelectionManager == null)
                    {
                        Debug.LogError("An instance of " + typeof(VRSelectionManager) + " is needed in the scene, but there is none.");
                    }
                }
                return theSelectionManager;
            }
        }
        #endregion Members

        #region Unity events
        void Update()
        {
            WandIndicateCheck();
        }
        #endregion Unity events

        private void WandIndicateCheck()
        {
            // Temporary.
            FakeWandMovement temp = FindObjectOfType<FakeWandMovement>();
            if (temp != null
                && temp.m_WandIsDisplayed)
            {
                WandIndicate();
                return;
            }

            if (null == TheSelectionManager.GetSelection())
            {
                WandHide();
            }
            else
            {
                WandIndicate();
            }
        }

        private void WandIndicate()
        {
            TheWand.Show(true);
        }

        private void WandHide()
        {
            TheWand.Show(false);
        }
    }
}