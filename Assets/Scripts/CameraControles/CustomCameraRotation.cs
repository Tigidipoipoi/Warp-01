using UnityEngine;
using System.Collections;

public class CustomCameraRotation : CleanBehaviourOnDestroy
{
    #region Members
    public bool m_InvertHorizontalRotation;
    public bool m_InvertVerticalRotation;
    public float m_HoriztontalRotationSpeed;
    public float m_VerticalRotationSpeed;

    private VRInteractionNavigationWandJoystick m_JoystickNavigation;
    #endregion Members

    public override void Start()
    {
        base.Start();

        // We disable the move by joystick but keep the rotation.
        m_JoystickNavigation = FindObjectOfType<VRInteractionNavigationWandJoystick>();
        m_JoystickNavigation.EnableTranslation(false);
        m_JoystickNavigation.EnableRotation(false);
    }

    public override void Die()
    {
        base.Die();

        m_JoystickNavigation.EnableTranslation(true);
        m_JoystickNavigation.EnableRotation(true);
    }

    public void Update()
    {
        // Horizontal Rotation.
        float hAxis = MiddleVR.VRDeviceMgr.GetWandHorizontalAxisValue();
        if (m_InvertHorizontalRotation)
        {
            hAxis = -hAxis;
        }
        RotateSight(hAxis, Vector3.up, m_HoriztontalRotationSpeed);

        // Vertical Rotation.
        float vAxis = MiddleVR.VRDeviceMgr.GetWandVerticalAxisValue();
        if (m_InvertVerticalRotation)
        {
            vAxis = -vAxis;
        }
        RotateSight(vAxis, Vector3.right, m_VerticalRotationSpeed);
    }

    public void RotateSight(float direction, Vector3 rotationAxis, float rotationSpeed)
    {
        if (direction == 0)
        {
            return;
        }

        direction = direction > Utils.c_FloatPrecision
            ? 1.0f : -1.0f;

        MVRCameraUtils.GetInstance.p_ShuttleContainer.Rotate(rotationAxis, direction * rotationSpeed * Time.deltaTime);
    }
}
