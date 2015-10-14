using UnityEngine;

public class ManagersSceneScript : MonoBehaviour
{
    public void Start()
    {
        ChangeSceneManager.GetInstance.LoadNeighbourLevel(true);

        Destroy(gameObject);
    }
}