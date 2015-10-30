using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class AttachCanvasToMainCamera : MonoBehaviour
{
    Canvas m_Canvas;
    public Text m_Text;

    void Start()
    {
        m_Canvas = GetComponent<Canvas>();
        StartCoroutine("AttachCamera");
    }


    public IEnumerator AttachCamera()
    {
        yield return new WaitForSeconds(0.5f);

        m_Text.text = "-Left Stick: Rotate camera."
            + "\n-B: Move."
            + "\n-A: Interact with glitches."
            + "\n-Hold Left Trigger: Move wand mode."
            + "\n-Hold Right Trigger: Rotate wand mode."
            + "\n-Right stick: Move or rotate wand."
            + "\n-Back: Reset wand's position and rotation."
            + "\n-Start: Toggle wand display.";
    }
}
