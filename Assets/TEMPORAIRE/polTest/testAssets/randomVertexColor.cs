using UnityEngine;
using System.Collections;

public class randomVertexColor : MonoBehaviour {

    int i = 0;
    Mesh mesh;
    Vector3[] vertices;
    Color[] colors;

    public int step = 500;

	// Use this for initialization
	void Start () {
         mesh = GetComponent<MeshFilter>().mesh;
         vertices = mesh.vertices;
         colors = new Color[vertices.Length];
	}
	
	// Update is called once per frame
	void Update () {
        while (i % step != 0)
        {
            colors[i] = new Color(Random.Range(0f, 0.5f), Random.Range(0f, 0.5f), Random.Range(0f, 0.5f));
            i++;
            if (i >= vertices.Length) i = 0;

            mesh.colors = colors;
        }
        i++;
        if (i >= vertices.Length) i = 0;
	}
}
