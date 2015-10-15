using UnityEngine;
using System.Collections;

public class PlayerScript : MonoBehaviour
{
    public SphereCollider m_PlayerCollider;
    public Rigidbody m_PlayerRigidbody;

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
