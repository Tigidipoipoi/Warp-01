using UnityEngine;
using System.Collections;

public class trackMovement : MonoBehaviour {

    Transform target;
    Transform playerCam;
    public string targetName = "VRSystemCenterNode";

    public float treshold = 2f;

    public bool canTranslate = true;

	// Use this for initialization
	void Start () {
        target = GameObject.Find(targetName).transform;
        playerCam = camDetect.mainCam.transform;
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = new Vector3(target.position.x, transform.position.y, target.position.z);

        if (Vector3.Distance(playerCam.position, transform.position) > 2f)
        {
            target.Translate(0.5f * Time.deltaTime * (playerCam.position - transform.position), Space.World);
        }

        if (Input.GetButtonDown("Fire1"))
        {
            canTranslate = !canTranslate;
        }
	}
}
