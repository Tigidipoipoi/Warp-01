using UnityEngine;
using MiddleVR_Unity3D;
using System;

public class TestLabScript : MonoBehaviour
{
    // This method will be called when the object is selected by the wand and the wand's main button is pressed.
    void VRAction()
    {
        vrCommand myCommand = new vrCommand("jambon", MyCommandHandler);
        myCommand.Do("MyValue"); // || true || 1 || 1.1f || 1.2d ...
    }

    private vrValue MyCommandHandler(vrValue iValue)
    {
        return null;
    }
}
