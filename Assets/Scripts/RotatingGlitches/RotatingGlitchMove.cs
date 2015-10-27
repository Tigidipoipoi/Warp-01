using UnityEngine;
using System.Collections;

[RequireComponent(typeof(RotatingGlitchRendererHandler))]
public class RotatingGlitchMove : MonoBehaviour
{
    #region Members
    public Transform m_Pivot;
    private bool m_FreeToRotate = true;
    public bool p_FreeToRotate
    {
        get
        {
            return m_FreeToRotate;
        }
        set
        {
            if (value
                && !m_FreeToRotate)
            {
                StartRotateAroundPivot();
            }

            m_FreeToRotate = value;
        }
    }

    [Tooltip("In degrees per second.")]
    public float m_RotationSpeed;

    public const float c_RotationAngle = 1.0f;
    public const string c_RotatingGlitchLayerName = Utils.LayerNames.IntangibleGlitch;
    #endregion Members

    public void Start()
    {
        if (m_Pivot == null)
        {
            m_Pivot = transform.parent;
        }

        StartRotateAroundPivot();
    }

    public void StartRotateAroundPivot()
    {
        StopCoroutine("RotateAroundPivot");
        StartCoroutine("RotateAroundPivot");
    }

    public IEnumerator RotateAroundPivot()
    {
        yield return new WaitForEndOfFrame();

        Quaternion rotation = new Quaternion();
        while (p_FreeToRotate)
        {
            rotation = Quaternion.AngleAxis(c_RotationAngle * m_RotationSpeed * Time.deltaTime, m_Pivot.up);
            transform.position = Utils.RotatePointAroundPivot(transform.position, m_Pivot.position, rotation);

            yield return null;
        }
    }
}