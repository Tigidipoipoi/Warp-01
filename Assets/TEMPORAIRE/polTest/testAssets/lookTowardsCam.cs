using UnityEngine;
using System.Collections;

public class lookTowardsCam : MonoBehaviour {

	void Start () {
	
	}
	
	void Update () {
        transform.LookAt(transform.position + camDetect.mainCam.transform.forward);
	}
}
