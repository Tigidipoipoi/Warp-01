using UnityEngine;
using System.Collections;

public class MoveCarpetArrowScript : MonoBehaviour
{
    public void OnTriggerEnter(Collider enteringCollider)
    {
        if (enteringCollider.tag == "Player")
        {
            Debug.Log("Entered carpet arrow \"" + name + "\".");
        }
    }
}