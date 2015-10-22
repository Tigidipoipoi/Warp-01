using UnityEngine;
using System.Collections;

[RequireComponent(typeof(RotatingGlitchRendererHandler))]
public class RotatingGlitchMove : MonoBehaviour
{
    #region Members
    public Transform m_Pivot;
    public bool m_FreeToRotate = true;
    [Tooltip("In degrees per second.")]
    public float m_RotationSpeed;
    public const float c_RotationAngle = 1.0f;
    #endregion Members

    public void Start()
    {
        m_Pivot = transform.parent;
        StartCoroutine("RotateAroundPivot");
    }

    public IEnumerator RotateAroundPivot()
    {
        Quaternion rotation = new Quaternion();

        while (m_FreeToRotate)
        {
            rotation = Quaternion.AngleAxis(c_RotationAngle * m_RotationSpeed * Time.deltaTime, m_Pivot.up);
            transform.position = Utils.RotatePointAroundPivot(transform.position, m_Pivot.position, rotation);

            yield return null;
        }
    }
}