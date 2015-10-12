using UnityEngine;

public class ShuttleGizmos : MonoBehaviour
{
    #region Members
    public bool m_DisplayGizmos = true;
    public Color m_ShuttleGizmoColor = new Color(0.0f, 100.0f, 0.0f, 0.5f);

    public Vector3 p_FloorPositionGizmo
    {
        get
        {
            return Vector3.up * -1.5f;
        }
    }
    public readonly Vector3 m_FloorSizeGizmo = new Vector3(6.0f, float.Epsilon, 3.0f);
    public Vector3 p_FrontPositionGizmo
    {
        get
        {
            return Vector3.forward * 1.5f;
        }
    }
    public readonly Vector3 m_FrontSizeGizmo = new Vector3(6.0f, 3.0f, float.Epsilon);
    public Vector3 p_LeftPositionGizmo
    {
        get
        {
            return -Vector3.right * 3.0f;
        }
    }
    public readonly Vector3 m_LeftSizeGizmo = new Vector3(float.Epsilon, 3.0f, 3.0f);
    public Vector3 p_RightPositionGizmo
    {
        get
        {
            return Vector3.right * 3.0f;
        }
    }
    public readonly Vector3 m_RightSizeGizmo = new Vector3(float.Epsilon, 3.0f, 3.0f);
    #endregion Members

    public void OnDrawGizmos()
    {
        if (!m_DisplayGizmos)
        {
            return;
        }

        Gizmos.color = m_ShuttleGizmoColor;
        Gizmos.matrix = transform.localToWorldMatrix;

        Gizmos.DrawCube(p_FloorPositionGizmo, m_FloorSizeGizmo);
        Gizmos.DrawCube(p_FrontPositionGizmo, m_FrontSizeGizmo);
        Gizmos.DrawCube(p_LeftPositionGizmo, m_LeftSizeGizmo);
        Gizmos.DrawCube(p_RightPositionGizmo, m_RightSizeGizmo);
    }
}
