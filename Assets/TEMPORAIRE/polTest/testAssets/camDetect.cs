using UnityEngine;
using System.Collections;

public class camDetect : MonoBehaviour {
    
    static public  Transform mainCam;

	// Use this for initialization
	void Start () {
        /*for (int i = 0; i < Camera.allCamerasCount; i++)
        {
            //MVRCameraUtils.GetInstance.p_CameraStereoFront            RETOURNE UN TRANSFORM
            //MVRCameraUtils.GetInstance.p_PlayerTransform
            //MVRCameraUtils.GetInstance.p_ShuttleContainer
            if (Camera.allCameras[i].tag != "backgroundCam")
            {
                mainCam = Camera.allCameras[i];
                i = Camera.allCamerasCount + 1;
            }
        }*/
        mainCam = MVRCameraUtils.GetInstance.p_PlayerTransform;
    }
}
