using UnityEngine;
using System.Collections;

public class hideSphere : MonoBehaviour {

    public bool isHidden = false;
    float progression = 0f;

    Material mat;

    public float strengthMove = 100f;

    float targetFlyHeight = 3.5f;
    Vector3 targetPos;
    

	void Start () {
        mat = GetComponent<MeshRenderer>().sharedMaterial;
        GetComponent<Rigidbody>().AddForce(15f * new Vector3(Random.Range(-1f, 1f), Random.Range(-1f, 1f), Random.Range(-1f, 1f)));
        GetComponent<Rigidbody>().useGravity = false;
	}
	
	void Update () {

        if (Input.GetKeyDown(KeyCode.Space))
            isHidden = !isHidden;

        if (isHidden)
        {
            progression = Mathf.Lerp(progression, 0f, Time.deltaTime * 3.5f);

            if (!GetComponent<Rigidbody>().useGravity && progression > 0.1f)
            {
                GetComponent<Rigidbody>().MovePosition(transform.position + new Vector3(Random.Range(-0.02f, 0.02f), Random.Range(-0.05f, 0.05f), Random.Range(-0.02f, 0.02f)));
            }
            else if (!GetComponent<Rigidbody>().useGravity && progression < 0.1f)
            {
                GetComponent<Rigidbody>().useGravity = true;
                GetComponent<Rigidbody>().AddForce(100f * new Vector3(Random.Range(-1f, 1f), Random.Range(-1f, 1f), Random.Range(-1f, 1f)));
            }

            if (Vector3.Angle(camDetect.mainCam.forward, (transform.position - camDetect.mainCam.position)) > 70f)
            {
                isHidden = false;
            }
        }
        else
        {
            progression = Mathf.Lerp(progression, 1f, Time.deltaTime * 3.5f);

            if (GetComponent<Rigidbody>().useGravity && progression > 0.1f)
            {
                GetComponent<Rigidbody>().useGravity = false;
                GetComponent<Rigidbody>().AddForce(Vector3.up* 200f);
                targetPos = transform.position + Random.insideUnitSphere;
                if (Mathf.Abs(targetPos.y - targetFlyHeight) > 0.4f)
                {
                    targetPos.y = targetFlyHeight + Random.Range(-0.3f, 0.3f);
                }
            }

            GetComponent<Rigidbody>().AddForce(10f * (targetPos - transform.position).normalized);
            if(Vector3.Distance(transform.position, targetPos) < 0.3f)
            {
                targetPos = transform.position + Random.insideUnitSphere;
                if (Mathf.Abs(targetPos.y - targetFlyHeight) > 0.4f)
                {
                    targetPos.y = targetFlyHeight + Random.Range(-0.3f, 0.3f);
                }
            }

            if (Vector3.Angle(camDetect.mainCam.forward, (transform.position - camDetect.mainCam.position)) < 30f)
            {
                isHidden = true;
            }
        }
        mat.SetFloat("_HIDE", progression);

	}

    void OnCollisionStay()
    {
        if (isHidden) 
        {
            //Vector3 forwardCam = camDetect.mainCam.forward;
            Vector3 targetBehind = camDetect.mainCam.position - 2f * camDetect.mainCam.forward;
            GetComponent<Rigidbody>().AddForce((((targetBehind - transform.position).normalized + ((transform.position - camDetect.mainCam.position).normalized / (0.2f*Vector3.Distance(transform.position, camDetect.mainCam.position)))) * Vector3.Angle((targetBehind - transform.position), (transform.position - camDetect.mainCam.position)) * strengthMove) / Mathf.Max(1f, GetComponent<Rigidbody>().velocity.magnitude));

        }
    }
}
