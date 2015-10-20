using UnityEngine;
using System.Collections;

/// <summary>
/// This script is made for test little functionnalities and will NOT stay in release.
/// </summary>
public class TestSomeStuff : MonoBehaviour
{
    private BoxCollider m_TriggerToCopy;
    private BoxCollider m_AddedTrigger;

    public IEnumerator Start()
    {
        yield return null;

        Utils.ClearLog();

        m_TriggerToCopy = GetComponent<BoxCollider>();

        m_AddedTrigger = MVRCameraUtils.GetInstance.p_ShuttleContainer.gameObject.AddComponent<BoxCollider>();
        m_AddedTrigger.SetFrom(m_TriggerToCopy);
    }

    public void Update()
    {
        if (Input.GetKeyUp(KeyCode.Space))
        {
            Destroy(m_AddedTrigger);
        }
    }
}
