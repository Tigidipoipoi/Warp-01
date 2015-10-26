using UnityEngine;
using System.Collections;

public class CustomCameraRotation : CleanBehaviourOnDestroy
{
    #region Members
    public bool m_InvertHorizontalRotation;
    public bool m_InvertVerticalRotation;
    public float m_HoriztontalRotationSpeed;
    public float m_VerticalRotationSpeed;
    [Range(0.0f, 89.0f)]
    public float m_MaxAngleUp = 45.0f;
    [Range(-89.0f, 0.0f)]
    public float m_MaxAngleDown = -45.0f;


    [Range(0, 4)]
    [Tooltip("There are 5 buttons on the Senso Light & Shadows, so choose in the range 0 to 4.")]
    public uint m_VerticalResetCameraButton = 2;

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

        // Reset Vertical Rotation.
        if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(m_VerticalResetCameraButton))
        {
            ResetVerticalRotation();
        }
    }

    public void RotateSight(float direction, Vector3 rotationAxis, float rotationSpeed, Space relativeSpace)
    {
        if (direction == 0)
        {
            return;
        }

        direction = direction > Utils.c_FloatPrecision
            ? 1.0f : -1.0f;

        Quaternion oldRotation = m_ShuttleTransform.rotation;
        m_ShuttleTransform.Rotate(rotationAxis, direction * rotationSpeed * Time.deltaTime, relativeSpace);

        // We check if the sight is between the boundaries angles.
        if (NeedToResetSight())
        {
            m_ShuttleTransform.rotation = oldRotation;
        }
    }

    public bool NeedToResetSight()
    {
        Vector3 neutralForward = Vector3.ProjectOnPlane(m_ShuttleTransform.forward - m_ShuttleTransform.position, Vector3.up);
        neutralForward -= m_ShuttleTransform.position;

        float pitchAngle = Vector3.Angle(neutralForward, m_ShuttleTransform.forward);
        Debug.Log(pitchAngle);

        return pitchAngle > m_MaxAngleUp || pitchAngle < m_MaxAngleDown;
    }

    public void ResetVerticalRotation()
    {
        m_ShuttleTransform.RotateToAlignWithPlaneAxis(m_ShuttleTransform.forward, Vector3.up);
    }
}
