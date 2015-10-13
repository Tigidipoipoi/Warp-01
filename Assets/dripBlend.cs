using UnityEngine;
using System.Collections;

public class dripBlend : MonoBehaviour {

    SkinnedMeshRenderer skin;

	void Start () {
        skin = GetComponent<SkinnedMeshRenderer>();
	}
	
	void Update () {
        skin.SetBlendShapeWeight(0, 100f * Mathf.Sin(Time.time * 5f));
        skin.SetBlendShapeWeight(1, 100f * Mathf.Sin(Time.time * 7f));
        skin.SetBlendShapeWeight(2, 100f * Mathf.Sin(Time.time * 3f));
        skin.SetBlendShapeWeight(3, 100f * Mathf.Sin(Time.time * 2f));
    }
}
