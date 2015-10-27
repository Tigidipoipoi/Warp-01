//using UnityEngine;
//using System.Collections;

/// <summary>
/// This script is made for test little functionnalities and will NOT stay in release.
/// </summary>
public class TestSomeStuff : CleanBehaviourOnDestroy
{
    private VRInteractionNavigationWandJoystick m_JoystickNavigation;

    public override void Start()
    {
        base.Start();

        // We disable the move by joystick but keep the rotation.
        m_JoystickNavigation = FindObjectOfType<VRInteractionNavigationWandJoystick>();
        m_JoystickNavigation.EnableTranslation(false);
    }

    public override void Die()
    {
        base.Die();

        m_JoystickNavigation.EnableTranslation(true);
    }
}