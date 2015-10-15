using UnityEngine;

public class ShuttleContainerScript : MonoBehaviour
{
    public string c_HeadNodeName = "HeadNode";

    public void Start()
    {
        GameObject headNode = transform.FindChild(c_HeadNodeName).gameObject;

        headNode.tag = "Player";

        SphereCollider headCollider = headNode.AddComponent<SphereCollider>();
        Rigidbody headRigidbody = headNode.AddComponent<Rigidbody>();
        headRigidbody.useGravity = false;
        headRigidbody.isKinematic = false;

        headNode.AddComponent<VRClusterObject>();
    }
}
