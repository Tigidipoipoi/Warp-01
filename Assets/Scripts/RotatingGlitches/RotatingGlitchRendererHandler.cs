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
}
