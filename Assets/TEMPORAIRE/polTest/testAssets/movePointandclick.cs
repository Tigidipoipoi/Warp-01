using UnityEngine;
using System.Collections;

public class movePointandclick : MonoBehaviour {

    bool isTranslating = false;
    public float timeTr = 0.7f;

    Transform playerCam;
    Transform navette;
    public string targetName = "VRSystemCenterNode";
    public string cameraName = "Camera0";

    Transform[] targets;

    public float treshold = 0.3f;

    public bool canTranslate = true;

	// Use this for initialization
	void Start () {
        targets = transform.GetComponentsInChildren<Transform>(); 
        navette = GameObject.Find(targetName).transform;
        playerCam = GameObject.Find(cameraName).transform;
	}
	
	// Update is called once per frame
	void Update () {
        if (!isTranslating && canTranslate)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if (Vector2.Distance(new Vector2(playerCam.position.x, playerCam.position.z), new Vector2(targets[i].position.x, targets[i].position.z)) <= treshold)
                {
                    StartCoroutine("goToPoint", targets[(i+1)%targets.Length].position);
                    i = targets.Length + 1;

                    canTranslate = false;
                    isTranslating = true;
                }
            }
        }
        else if (!isTranslating && !canTranslate)
        {
            bool reverse = true;
            for (int i = 0; i < targets.Length; i++)
            {
                if (Vector2.Distance(new Vector2(playerCam.position.x, playerCam.position.z), new Vector2(targets[i].position.x, targets[i].position.z)) <= treshold)
                {
                    reverse = false;
                }
            }

            if (reverse) canTranslate = true;
        }
	}

    IEnumerator goToPoint(Vector3 targetPos)
    {
        Vector3 posWithOffset = new Vector3(targetPos.x, navette.position.y, targetPos.z) - new Vector3(playerCam.position.x-navette.position.x, 0f, playerCam.position.z-navette.position.z);
        float _temp = Time.time;
        while (Time.time - _temp < timeTr)
        {
            navette.position = Vector3.Lerp(navette.position, posWithOffset, Time.deltaTime * 8f);
            yield return null;
        }
        navette.position = posWithOffset;
        isTranslating = false;
    }
}
