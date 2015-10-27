using UnityEngine;

public class ShuttleContainerScript : MonoBehaviour
{
    #region Members
    public string c_HeadNodeName = "HeadNode";
    public float c_ColliderRadius = 0.25f;
    public static readonly Vector3 c_CaveSizeIRL = new Vector3(6.0f, 3.0f, 3.0f);
    #endregion Members

    public void Start()
    {
        GameObject headNode = transform.FindChild(c_HeadNodeName).gameObject;
        headNode.tag = Utils.Tags.Player;
        headNode.layer = LayerMask.NameToLayer(Utils.LayerNames.Player);

        SphereCollider headCollider = headNode.AddComponent<SphereCollider>();
        headCollider.radius = c_ColliderRadius;
        Rigidbody headRigidbody = headNode.AddComponent<Rigidbody>();
        headRigidbody.useGravity = false;
        headRigidbody.isKinematic = false;

        headNode.AddComponent<VRClusterObject>();
    }
}
