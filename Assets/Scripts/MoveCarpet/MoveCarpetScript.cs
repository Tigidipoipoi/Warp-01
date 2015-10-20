using UnityEngine;
using System.Collections;

public class MoveCarpetScript : MonoBehaviour
{
    #region Members
    public float m_MoveSpeed = 0.001f;

    [HideInInspector]
    public bool m_IsDisplayed = true;
    [HideInInspector]
    public Transform m_OriginalParent;

    private ChangeSceneManager.DestroyLastLevelLoadedHandler m_DestroyHandler;
    private VRInteractionNavigationWandJoystick m_JoystickNavigation;
    private MoveCarpetEnableHandler m_MoveCarpetEnableHandler;
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_OriginalParent = transform.parent;

        m_MoveCarpetEnableHandler = FindObjectOfType<MoveCarpetEnableHandler>();

        // Prepare to clean on new scene load.
        m_DestroyHandler = new ChangeSceneManager.DestroyLastLevelLoadedHandler(ResetMoveCarpetForDestroy);
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded += m_DestroyHandler;

        // We disable the move by joystick but keep the rotation.
        m_JoystickNavigation = FindObjectOfType<VRInteractionNavigationWandJoystick>();
        m_JoystickNavigation.EnableTranslation(false);

        EnableMoveCarpet(false);
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(2))
        {
            PlaceAndRotateCarpetOnPlayer();

            // We assert that the whole carpet can be reachable.
            if (m_MoveCarpetEnableHandler)
            {
                EnableMoveCarpet(!m_IsDisplayed);
            }
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == "Player")
        {
            EnableMoveCarpet(false);
        }
    }

    public void OnDestroy()
    {
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded -= m_DestroyHandler;
        m_JoystickNavigation.EnableTranslation(true);
    }
    #endregion Unity Events

    public void EnableMoveCarpet(bool enable = true)
    {
        m_IsDisplayed = enable;
        transform.EnableAllChildren(m_IsDisplayed);
    }

    public void PlaceAndRotateCarpetOnPlayer()
    {
        Vector3 playerPosition = MVRCameraUtils.GetInstance.p_PlayerTransform.position;
        // We offset by "Utils.c_FloatPrecision" to avoid arrows to superimpose with the ground.
        playerPosition.y -= MVRCameraUtils.GetInstance.p_PlayerTransform.localPosition.y - Utils.c_FloatPrecision;

        // Place
        transform.position = playerPosition;
        transform.parent = MVRCameraUtils.GetInstance.p_ShuttleContainer;

        // Rotate
        transform.localRotation = Quaternion.identity;
    }

    #region Move Methods & Coroutines
    #region Human joystick
    public void StartMoveShuttleInDirection()
    {
        StopCoroutine("MoveShuttleInDirection");
        StartCoroutine("MoveShuttleInDirection");
    }

    private IEnumerator MoveShuttleInDirection()
    {
        Debug.Log("Start MoveShuttleInDirection");
        Vector3 playerPosition = new Vector3();
        Vector3 moveDirection = new Vector3();
        while (m_IsDisplayed)
        {
            playerPosition = MVRCameraUtils.GetInstance.p_PlayerTransform.position;

            moveDirection = playerPosition - transform.position;
            moveDirection = Vector3.ProjectOnPlane(moveDirection, transform.up).normalized;

            MVRCameraUtils.GetInstance.SetShuttlePosition(moveDirection * m_MoveSpeed, additive: true);

            yield return null;
        }
    }
    #endregion Human joystick

    #region DDR Carpet
    public void StartMoveShuttleInDirection(e_Directions direction)
    {
        if (direction == e_Directions.COUNT
            || direction == e_Directions.UP
            || direction == e_Directions.DOWN)
        {
            return;
        }

        StopCoroutine("MoveShuttleInDirection");
        StartCoroutine("MoveShuttleInDirection", direction);
    }

    private IEnumerator MoveShuttleInDirection(e_Directions direction)
    {
        Vector3 moveDirection = new Vector3();
        while (m_IsDisplayed)
        {
            switch (direction)
            {
                case e_Directions.LEFT:
                    moveDirection = -MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.right;
                    break;
                case e_Directions.FORWARD:
                    moveDirection = MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.forward;
                    break;
                case e_Directions.RIGHT:
                    moveDirection = MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.right;
                    break;
                case e_Directions.BACKWARD:
                    moveDirection = -MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.forward;
                    break;
            }

            MVRCameraUtils.GetInstance.SetShuttlePosition(moveDirection * m_MoveSpeed, additive: true);

            yield return null;
        }
    }
    #endregion DDR Carpet

    public void StopMoveShuttleInDirection()
    {
        StopCoroutine("MoveShuttleInDirection");
    }
    #endregion Move Methods & Coroutines

    #region Destroy Handler
    public void ResetMoveCarpetForDestroy()
    {
        transform.parent = m_OriginalParent;
        EnableMoveCarpet(false);
    }
    #endregion Destroy handler
}
