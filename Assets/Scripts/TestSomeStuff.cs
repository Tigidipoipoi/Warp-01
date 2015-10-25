using UnityEngine;
using System.Collections;

/// <summary>
/// This script is made for test little functionnalities and will NOT stay in release.
/// </summary>
public class TestSomeStuff : MonoBehaviour
{
    public IEnumerator Start()
    {
        yield return null;

        Utils.ClearLog();
    }
}
