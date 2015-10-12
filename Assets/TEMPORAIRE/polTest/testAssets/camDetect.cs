using UnityEngine;
using System.Collections;

public class camDetect : MonoBehaviour {
    
    static public  Camera mainCam;

	// Use this for initialization
	void Awake () {
        for (int i = 0; i < Camera.allCamerasCount; i++)
        {
            if (Camera.allCameras[i].tag != "backgroundCam")
            {
                mainCam = Camera.allCameras[i];
                i = Camera.allCamerasCount + 1;
            }
        }
	}
}
