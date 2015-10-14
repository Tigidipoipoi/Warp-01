using UnityEngine;

public class ShuttleContainerScript : MonoBehaviour
{
    public void Start()
    {
        GameObject headNode = transform.FindChild("HeadNode").gameObject;

        headNode.tag = "Player";

        SphereCollider headCollider = headNode.AddComponent<SphereCollider>();
        Rigidbody headRigidbody = headNode.AddComponent<Rigidbody>();
        headRigidbody.useGravity = false;
        headRigidbody.isKinematic = false;

        headNode.AddComponent<VRClusterObject>();
    }
}
