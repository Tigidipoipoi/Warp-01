using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Renderer))]
public class RotatingGlitchRendererHandler : MonoBehaviour
{
    #region Members
    public Renderer m_Renderer;
    public Material m_GlitchedMaterial;
    public Material m_OrdinaryMaterial;
    #endregion Members

    public void Start()
    {
        m_Renderer = GetComponent<Renderer>();

        ActivateOrdinaryMaterial();
    }

    public void ActivateGlitchedMaterial()
    {
        m_Renderer.material = m_GlitchedMaterial;
    }

    public void ActivateOrdinaryMaterial()
    {
        m_Renderer.material = m_OrdinaryMaterial;
    }

    public void OnImmobile(RotatingGlitchMove sender)
    {
        StartCoroutine("ImmobileReaction", sender);
    }

    private IEnumerator ImmobileReaction(RotatingGlitchMove sender)
    {
        Material previousMat = m_Renderer.material;
        m_Renderer.material = m_GlitchedMaterial;

        while (!sender.p_FreeToRotate)
        {
            float hideValue = Mathf.Sin((float)MiddleVR.VRKernel.GetDeltaTime());
            hideValue = Mathf.Clamp(hideValue, 0.2f, 0.5f);

            m_Renderer.material.SetFloat("_HIDE", hideValue);

            yield return null;
        }

        m_Renderer.material = previousMat;
    }
}
