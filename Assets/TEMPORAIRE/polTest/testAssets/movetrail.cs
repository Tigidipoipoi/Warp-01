using UnityEngine;
using System.Collections;

public class movetrail : MonoBehaviour {

    Vector3 iniPos;

	// Use this for initialization
	void Start () {
        iniPos = transform.localPosition;
	}
	
	// Update is called once per frame
	void FixedUpdate () {
        transform.localPosition = iniPos + Random.insideUnitSphere * 0.6f;
	}
}
