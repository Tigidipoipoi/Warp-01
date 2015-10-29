using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class WallGlitch : MonoBehaviour {

        public float openTime = 5;
        public float openDistance = 3;
        public float switchBeatTime = 2;
        public float switchBeatScale = 0.05f;

        public Transform leftWall;
        public Transform rightWall;

        public Transform theSwitch;

        public ParticleSystem theLight;

        public bool finishOpen = false;

        public float switchResetTime = 2f;

        private Vector3 beforeSwitchPosition;
        private Vector3 beforeSwitchScale;
        private bool isReset = false;
        private vrTimer theSeconds = new vrTimer();
        private vrTimer theBeat = new vrTimer();

        private static VRSelectionManager theSelectionManager;
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

        #region Unity events
        // Use this for initialization
        void Start() {
            #region Check null members
            if(leftWall == null)
            {
                leftWall = transform.FindChild("LeftWall");
            }

            if (rightWall == null)
            {
                rightWall = transform.FindChild("RightWall");
            }

            if (theSwitch == null)
            {
                Debug.LogError("WallGlitch::Start => No shuttle attached to the switch \"" + name + "\".");
            }

            if(theLight == null)
            {
                Debug.LogError("WallGlitch::Start => No shuttle attached to the light \"" + name + "\".");
            }
            #endregion Check null members

            beforeSwitchPosition = theSwitch.localPosition;
            beforeSwitchScale = theSwitch.localScale;
            theLight.Stop();
        }

        // Update is called once per frame
        void Update() {

            if (theSwitch != null)
            {
                Vector3 thePosition = theSwitch.localPosition;
                thePosition.z = beforeSwitchPosition.z;
                theSwitch.localPosition = thePosition;
                theSwitch.localRotation = Quaternion.EulerRotation(Vector3.zero);

                SwitchBeat();

                if (EnterButtonDown() && TheSelectionManager.GetSelection() != null)
                {
                    if (TheSelectionManager.GetSelection().SelectedObject == theSwitch.gameObject)
                    {
                        theLight.Play();
                    }
                }

                if (!finishOpen && !isReset && EnterButtonUp())
                {
                    isReset = true;
                    theLight.Stop();
                    StartCoroutine("SwitchPositionReset");
                }
                else if(finishOpen && EnterButtonUp())
                {
                    Destroy(theSwitch.gameObject);
                    theSwitch = null;
                }
            }

        }

        void OnTriggerEnter(Collider other)
        {
            if (!finishOpen && other.name == "Switch")
            {
                finishOpen = true;
                StartCoroutine("OpenDoor");
            }
        }
        #endregion Unity events


        public IEnumerator OpenDoor()
        {
            float theDistance = 0;
            float beforeSecond = 0;
            theSeconds.Reset();

            while (true)
            {
                if (theSeconds.seconds() >= openTime)
                {
                    finishOpen = true;
                    yield break;
                }

                float flameTime = (float)theSeconds.seconds() - beforeSecond;
                float theRatio = flameTime / openTime;
                theDistance = openDistance * theRatio;

                leftWall.localPosition += new Vector3(-theDistance, 0, 0);
                rightWall.localPosition += new Vector3(theDistance, 0, 0);

                beforeSecond = (float)theSeconds.seconds();
                yield return null;
            }
        }

        public bool EnterButtonDown()
        {
            if (
#if UNITY_EDITOR
                    Input.GetButtonDown("Fire1")
#else
                    MiddleVR.VRDeviceMgr.IsWandButtonToggled(0, true)
#endif
                    )
            {
                return true;
            }

            return false;
        }
        public bool EnterButtonUp()
        {
            if (
#if UNITY_EDITOR
                    Input.GetButtonUp("Fire1")
#else
                    MiddleVR.VRDeviceMgr.IsWandButtonToggled(0, false)
#endif
                    )
            {
                return true;
            }

            return false;
        }

        private IEnumerator SwitchPositionReset()
        {
            Vector3 afterPosition = theSwitch.localPosition;
            theSeconds.Reset();

            while((float)theSeconds.seconds() < switchResetTime)
            {
                Vector3 moveDistance = beforeSwitchPosition - afterPosition;
                float theRatio = (Mathf.PI * 0.5f) / switchResetTime * (float)theSeconds.seconds();
                theRatio = Mathf.Sin(theRatio);
                theSwitch.localPosition = afterPosition + (moveDistance * theRatio);

                yield return null;
            }

            theSwitch.localPosition = beforeSwitchPosition;
            isReset = false;
        }
        
        private void SwitchBeat()
        {
            if((float)theBeat.seconds() > switchBeatTime)
            {
                theBeat.Reset();
            }
            float theRatio = (Mathf.PI * 2) / switchBeatTime * (float)theBeat.seconds();
            theRatio = Mathf.Sin(theRatio);

            Vector3 theScale = beforeSwitchScale;
            theScale.z += (switchBeatScale * theRatio);
            theSwitch.localScale = theScale;

        }
    }
}
