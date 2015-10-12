using UnityEngine;
using System.Collections;

public class translateTris : MonoBehaviour {

	Mesh mesh;
	int[] triangles;
	int[] trianglesCopy;

	public Transform targetTransform;

	public MeshFilter[] targetMeshes;

	public int step = 3;
	int indexMultiMorph = 0;

	// Use this for initialization
	void Start () {
		mesh = GetComponent<MeshFilter>().mesh;
		triangles = mesh.triangles;
		trianglesCopy = mesh.triangles;

		StartCoroutine ("translateVerts");
	}
	
	void Update() {

		/*int i = 0;
		while (i < triangles.Length) {
			triangles[i] += Vector3.up * Time.deltaTime;
			i++;
		}
		mesh.triangles = triangles;
		mesh.RecalculateBounds();*/
	}

	IEnumerator translateVerts(){
		int i = 0;
		while (true) {

			/// FOLLOW TARGET
			//triangles[i] = trianglesCopy[i] + targetTransform.position; //sa décon pa tro
			//triangles[i] = triangles[i] + targetTransform.position; //sa décon grav


			/// GANGRENE
			/*triangles[i] = trianglesCopy[i] + new Vector3(Random.Range(-0.2f,0.2f),Random.Range(-0.2f,0.2f),Random.Range(-0.2f,0.2f));
			triangles[((int)triangles.Length + i-20)%triangles.Length] = trianglesCopy[((int)triangles.Length + i-20)%triangles.Length];*/

			/// MORPH SINGLE
			//triangles[i] = targetMesh.mesh.triangles[i%targetMesh.mesh.triangles.Length];
			//triangles[((int)triangles.Length + i-200)%triangles.Length] = trianglesCopy[((int)triangles.Length + i-200)%triangles.Length];

			/// MORPH MULTI
			triangles[i%trianglesCopy.Length] = targetMeshes[indexMultiMorph].mesh.triangles[i%targetMeshes[indexMultiMorph].mesh.triangles.Length];


			/// BEAST
			// SIN // 
			//triangles[i] = trianglesCopy[i] + 0.2f*trianglesCopy[i]*Vector3.Distance(targetTransform.position, transform.position)*Mathf.Sin(Time.time+trianglesCopy[i].x*10f)*Mathf.Cos(Time.time+trianglesCopy[i].z*8f)*Mathf.Sin(Time.time+trianglesCopy[i].y*9f);
			// PERLIN 
			// triangles[i] = trianglesCopy[i] + 0.2f*trianglesCopy[i]*Vector3.Distance(targetTransform.position, transform.position)*Mathf.PerlinNoise(Time.time+trianglesCopy[i].x*5f,0f)*Mathf.PerlinNoise(5f,Time.time+trianglesCopy[i].z*5f);

			mesh.triangles = triangles;
			mesh.RecalculateBounds();

			i++;
			/*if (i >= triangles.Length){
				i = 0;
				indexMultiMorph ++;
				if (indexMultiMorph >= targetMeshes.Length) indexMultiMorph = 0;
			}*/
			if (i > targetMeshes[indexMultiMorph].mesh.triangles.Length*4f){
				i=0;
				indexMultiMorph ++;
				if (indexMultiMorph >= targetMeshes.Length) indexMultiMorph = 0;
			}
			if (i%step == 0) yield return null;
		}
	}
}
