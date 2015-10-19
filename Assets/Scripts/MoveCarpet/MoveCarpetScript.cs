using UnityEngine;
using System.Collections;

public class MoveCarpetScript : MonoBehaviour
{
    #region Members
    [HideInInspector]
    public bool m_IsDisplayed = true;
    public float m_MoveSpeed = 0.001f;
    public Transform m_OriginalParent;

    private ChangeSceneManager.DestroyLastLevelLoadedHandler m_DestroyHandler;
    #endregion Members

    #region Unity Events
    public void Start()
    {
        m_OriginalParent = transform.parent;

        EnableMoveCarpet(false);

        m_DestroyHandler = new ChangeSceneManager.DestroyLastLevelLoadedHandler(ResetMoveCarpetForDestroy);
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded += m_DestroyHandler;
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(2))
        {
            PlaceAndRotateCarpetOnPlayer();
            EnableMoveCarpet(!m_IsDisplayed);
        }
    }

    public void OnTriggerExit(Collider exitingCollider)
    {
        if (exitingCollider.tag == "Player")
        {
            EnableMoveCarpet(false);
        }
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

    public void StopMoveShuttleInDirection()
    {
        StopCoroutine("MoveShuttleInDirection");
    }

    private IEnumerator MoveShuttleInDirection(e_Directions direction)
    {
        while (m_IsDisplayed)
        {
            Vector3 moveDirection = new Vector3();
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
            Debug.Log(moveDirection.ToString() + " & " + m_MoveSpeed.ToString());

            MVRCameraUtils.GetInstance.SetShuttlePosition(moveDirection * m_MoveSpeed, additive: true);

            yield return null;
        }
    }

    public void ResetMoveCarpetForDestroy()
    {
        transform.parent = m_OriginalParent;
        EnableMoveCarpet(false);
    }

    public void OnDestroy()
    {
        ChangeSceneManager.GetInstance.OnDestroyLastLevelLoaded -= m_DestroyHandler;
    }
}
