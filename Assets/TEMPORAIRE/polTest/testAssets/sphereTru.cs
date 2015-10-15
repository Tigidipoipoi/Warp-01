using UnityEngine;
using System.Collections;

public class sphereTru : MonoBehaviour {

    public bool isInside = false;

    float radius;

    public Transform insideSphere;
    public Transform insideErrorTxt;

    TrailRenderer line;

	// Use this for initialization
	void Start () {
        radius = GetComponent<SphereCollider>().radius * transform.localScale.x;
        line = insideSphere.parent.GetComponentInChildren<TrailRenderer>();
    }
	
	// Update is called once per frame
	void Update () {
        if (!isInside)
        {
            if (Vector3.Distance(camDetect.mainCam.position, transform.position) <= radius)
            {
                isInside = true;
                line.enabled = true;
                transform.parent.Translate(-insideSphere.position + transform.position);
            }
        }
        else
        {
            insideErrorTxt.position = camDetect.mainCam.position;


            if (Vector3.Distance(camDetect.mainCam.position, insideSphere.position) > radius)
            {
                isInside = false;
                line.enabled = false;
                transform.parent.Translate(insideSphere.position - transform.position);
                insideErrorTxt.position = insideSphere.position;
            }
        }
        Quaternion oldrot = insideErrorTxt.rotation;
        insideErrorTxt.LookAt(insideErrorTxt.position + camDetect.mainCam.forward);
        insideErrorTxt.rotation = Quaternion.Lerp(oldrot, insideErrorTxt.rotation, Time.deltaTime * 2f);
    }

}