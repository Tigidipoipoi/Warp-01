using UnityEngine;
using System.Collections;

/// <summary>
/// This script is made for test little functionnalities and will NOT stay in release.
/// </summary>
public class TestSomeStuff : MonoBehaviour
{
    private VRInteractionNavigationWandJoystick m_JoystickNavigation;
    private bool m_EnableTranslation;

    public IEnumerator Start()
    {
        yield return null;

        Utils.ClearLog();

        m_JoystickNavigation = FindObjectOfType<VRInteractionNavigationWandJoystick>();
    }

    public void Update()
    {
        if (Input.GetKeyUp(KeyCode.Space))
        {
            m_JoystickNavigation.EnableTranslation(m_EnableTranslation);
            m_EnableTranslation = !m_EnableTranslation;
        }
    }
}
