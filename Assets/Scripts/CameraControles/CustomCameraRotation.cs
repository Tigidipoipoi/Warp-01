using UnityEngine;
using System.Collections;

public class CustomCameraRotation : CleanBehaviourOnDestroy
{
    #region Members
    public bool m_InvertHorizontalRotation;
    public bool m_InvertVerticalRotation;
    public float m_HoriztontalRotationSpeed;
    public float m_VerticalRotationSpeed;
    public float m_MaxAngleUp;
    public float m_MaxAngleDown;

    private Transform m_ShuttleTransform;
    private VRInteractionNavigationWandJoystick m_JoystickNavigation;
    #endregion Members

    public override void Start()
    {
        base.Start();

        m_ShuttleTransform = MVRCameraUtils.GetInstance.p_ShuttleContainer;

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
        RotateSight(hAxis, Vector3.up, m_HoriztontalRotationSpeed, Space.World);

        // Vertical Rotation.
        float vAxis = MiddleVR.VRDeviceMgr.GetWandVerticalAxisValue();
        if (m_InvertVerticalRotation)
        {
            vAxis = -vAxis;
        }
        RotateSight(vAxis, Vector3.right, m_VerticalRotationSpeed, Space.Self);
    }

    public void RotateSight(float direction, Vector3 rotationAxis, float rotationSpeed, Space relativeSpace)
    {
        if (direction == 0)
        {
            return;
        }

        direction = direction > Utils.c_FloatPrecision
            ? 1.0f : -1.0f;

        m_ShuttleTransform.Rotate(rotationAxis, direction * rotationSpeed * Time.deltaTime, relativeSpace);
    }
}
