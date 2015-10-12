﻿using UnityEngine;

public static class VectorExtension
{
    public static Vector2 GetXY(this Vector3 vec)
    {
        return new Vector2(vec.x, vec.y);
    }

    public static Vector2 GetXZ(this Vector3 vec)
    {
        return new Vector2(vec.x, vec.z);
    }

    public static Vector2 GetYZ(this Vector3 vec)
    {
        return new Vector2(vec.y, vec.z);
    }
}
