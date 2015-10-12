using UnityEngine;
using System.Collections;

public class translateVertices : MonoBehaviour {

	Mesh mesh;
	Vector3[] vertices;
	Vector3[] verticesCopy;
    //Transform[] cameraTransforms;

	Transform targetTransform;
    //public string targetTransformName = "Camera0";

	public MeshFilter[] targetMeshes;

	public int step = 3;
	int indexMultiMorph = 0;

	// Use this for initialization
	void Start () {
		mesh = GetComponent<MeshFilter>().mesh;
		vertices = mesh.vertices;
		verticesCopy = mesh.vertices;
        //targetTransform = GameObject.Find(targetTransformName).transform;

        targetTransform = Camera.allCameras[0].transform;

		StartCoroutine ("translateVerts");
	}
	
	void Update() {

		/*int i = 0;
		while (i < vertices.Length) {
			vertices[i] += Vector3.up * Time.deltaTime;
			i++;
		}
		mesh.vertices = vertices;
		mesh.RecalculateBounds();*/
	}

	IEnumerator translateVerts(){
		int i = 0;
		while (true) {

			/// FOLLOW TARGET
			//vertices[i] = verticesCopy[i] + targetTransform.position; //sa décon pa tro
			//vertices[i] = vertices[i] + targetTransform.position; //sa décon grav


			/// GANGRENE
			/*vertices[i] = verticesCopy[i] + new Vector3(Random.Range(-0.2f,0.2f),Random.Range(-0.2f,0.2f),Random.Range(-0.2f,0.2f));
			vertices[((int)vertices.Length + i-20)%vertices.Length] = verticesCopy[((int)vertices.Length + i-20)%vertices.Length];*/

			/// MORPH SINGLE
			//vertices[i] = targetMesh.mesh.vertices[i%targetMesh.mesh.vertices.Length];
			//vertices[((int)vertices.Length + i-200)%vertices.Length] = verticesCopy[((int)vertices.Length + i-200)%vertices.Length];

			/// MORPH MULTI
			//vertices[i%vertices.Length] = targetMeshes[indexMultiMorph].mesh.vertices[i%targetMeshes[indexMultiMorph].mesh.vertices.Length];


			/// BEAST
			// SIN // 
			vertices[i] = verticesCopy[i] + 0.2f*verticesCopy[i]*Vector3.Distance(targetTransform.position, transform.position)*Mathf.Sin(Time.time+verticesCopy[i].x*10f)*Mathf.Cos(Time.time+verticesCopy[i].z*8f)*Mathf.Sin(Time.time+verticesCopy[i].y*9f);
			// PERLIN 
			// vertices[i] = verticesCopy[i] + 0.2f*verticesCopy[i]*Vector3.Distance(targetTransform.position, transform.position)*Mathf.PerlinNoise(Time.time+verticesCopy[i].x*5f,0f)*Mathf.PerlinNoise(5f,Time.time+verticesCopy[i].z*5f);

			mesh.vertices = vertices;
			mesh.RecalculateBounds();

			i++;
			if (i >= vertices.Length){
				i = 0;
				indexMultiMorph ++;
				if (indexMultiMorph >= targetMeshes.Length) indexMultiMorph = 0;
			}
			/*if (i > targetMeshes[indexMultiMorph].mesh.vertices.Length*4f){
				i=0;
				indexMultiMorph ++;
				if (indexMultiMorph >= targetMeshes.Length) indexMultiMorph = 0;
			}*/
			if (i%step == 0) yield return null;
		}
	}
}
