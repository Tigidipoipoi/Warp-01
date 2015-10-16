using UnityEngine;
using System.Collections;

public class MoveCarpetScript : MonoBehaviour
{
    [HideInInspector]
    public bool m_IsDisplayed = true;
    public float m_MoveSpeed;

    public void Start()
    {
        ToggleMoveCarpet();
    }

    public void Update()
    {
        if (MiddleVR.VRDeviceMgr.IsWandButtonToggled(2))
        {
            CenterCarpetOnPlayer();
            ToggleMoveCarpet();
        }
    }

    public void ToggleMoveCarpet()
    {
        m_IsDisplayed = !m_IsDisplayed;
        transform.EnableAllChildren(m_IsDisplayed);
    }

    public void CenterCarpetOnPlayer()
    {
        Vector3 playerPosition = MVRCameraUtils.GetInstance.p_PlayerTransform.position;
        // We offset by "Utils.c_FloatPrecision" to avoid arrows to superimpose with the ground.
        playerPosition.y -= MVRCameraUtils.GetInstance.p_PlayerTransform.localPosition.y - Utils.c_FloatPrecision;

        transform.position = playerPosition;
    }

    public void StartMoveShuttleInDirection(e_Directions direction)
    {
        if (direction == e_Directions.COUNT)
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
        while (direction != e_Directions.COUNT)
        {
            Vector3 moveDirection = new Vector3();
            switch (direction)
            {
                case e_Directions.LEFT:
                    moveDirection = -MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.right;
                    break;
                case e_Directions.UP:
                    moveDirection = MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.forward;
                    break;
                case e_Directions.RIGHT:
                    moveDirection = MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.right;
                    break;
                case e_Directions.DOWN:
                    moveDirection = -MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.forward;
                    break;
            }

            //MVRCameraUtils.GetInstance.p_ShuttleContainer.transform.position = ;

            yield return null;
        }
    }
}
