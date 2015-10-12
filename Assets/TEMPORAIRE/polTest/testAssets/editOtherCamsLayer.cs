using UnityEngine;
using System.Collections;

public class editOtherCamsLayer : MonoBehaviour {

    //public string otherCamName = "Camera0";

    Transform mainCam;

	// Use this for initialization
	void Start () {
        int layerMask = 1 << LayerMask.NameToLayer("background");
        layerMask = ~layerMask;

        foreach (Camera cam in Camera.allCameras)
        {
            if (cam.tag != "backgroundCam")
            {
                cam.cullingMask = layerMask;
                cam.clearFlags = CameraClearFlags.Depth;
            }
        }

        mainCam = camDetect.mainCam.transform;
	}
	
	// Update is called once per frame
	void Update () {
        transform.rotation = mainCam.rotation;
	}
}
