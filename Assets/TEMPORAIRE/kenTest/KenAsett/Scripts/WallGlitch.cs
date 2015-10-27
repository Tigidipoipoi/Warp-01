using UnityEngine;
using System.Collections;

namespace Warp01
{
    public class WallGlitch : MonoBehaviour {

        public float openTime = 5;
        public float openDistance = 3;

        public Transform leftWall;
        public Transform rightWall;

        public bool finishOpen = false;

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
            #endregion Check null members

        }

        // Update is called once per frame
        void Update() {

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
            vrTimer theSeconds = new vrTimer();
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
    }
}
