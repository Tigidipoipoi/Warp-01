using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

/// <summary>
/// This class regroups a bunch of static method and extensions usefull for most of the other classes.
/// </summary>
public static class Utils
{
    public const float c_CentimetersToInchesCoef = 0.3937f;

    public const float c_FloatPrecision = 0.01f;

    public const int c_ImageResolution = 100;

    #region Misc
    /// <summary>
    /// </summary>
    /// <param name="points"></param>
    /// <returns>The isobarycenter for all points.</returns>
    public static Vector3 GetBarycenter(params Vector3[] points)
    {
        Vector3 barycenter = Vector3.zero;

        int pointsCount = points.Length;
        for (int i = 0; i < pointsCount; ++i)
        {
            barycenter += points[i];
        }
        barycenter /= pointsCount;

        return barycenter;
    }

    /// <summary>
    /// Compute the position of point around pivot according to angle.
    /// </summary>
    /// <returns>The new point's position around pivot.</returns>
    /// <param name="point">Point.</param>
    /// <param name="pivot">Pivot.</param>
    /// <param name="angle">Angle.</param>
    public static Vector3 RotatePointAroundPivot(Vector3 point, Vector3 pivot, Quaternion angle)
    {
        return angle * (point - pivot) + pivot;
    }

    /// <summary>
    /// Compute the position of point around pivot according to angle.
    /// </summary>
    /// <returns>The new point's position around pivot.</returns>
    /// <param name="point">Point.</param>
    /// <param name="pivot">Pivot.</param>
    /// <param name="angle">Angle.</param>
    public static Vector3 RotatePointAroundPivot(Vector3 point, Vector3 pivot, Vector3 eulerAngle)
    {
        Quaternion angle = Quaternion.Euler(eulerAngle);

        return angle * (point - pivot) + pivot;
    }

    /// <summary>
    /// Converts a distance in meters into pixels according to the image resolution (PPP).\n
    /// Note that you can use this method to convert meters to Unity's distance too (if you use the default imageResolution).
    /// </summary>
    /// <param name="distance">Distance in meters that must be converted.</param>
    /// <param name="imageResolution">The image's PPP.\n
    /// In EasyBuild all MultiTargets have a PPP of 72 by default.</param>
    /// <returns></returns>
    public static float ConvertMetersToPixels(float distance, int imageResolution = c_ImageResolution)
    {
        // We need to convert meters to centimeters before the product with the resolution.
        float distanceInPixels = distance * 100.0f * c_CentimetersToInchesCoef * imageResolution;

        return Mathf.Round(distanceInPixels);
    }

    /// <summary>
    /// Clears the Unity editor's console.
    /// </summary>
    public static void ClearLog()
    {
#if UNITY_EDITOR
        System.Reflection.Assembly assembly = System.Reflection.Assembly
            .GetAssembly(typeof(UnityEditor.ActiveEditorTracker));

        System.Type type = assembly.GetType("UnityEditorInternal.LogEntries");
        System.Reflection.MethodInfo method = type.GetMethod("Clear");
        method.Invoke(new object(), null);
#endif
    }

    /// <summary>
    /// Determines if an object is too far from source following the specified axis.
    /// </summary>
    /// <returns><c>true</c> if object is too far from source; otherwise, <c>false</c>.</returns>
    /// <param name="source">Source.</param>
    /// <param name="objectColliderCorners">Object's collider's corners.</param>
    /// <param name="axisToCheckDistance">Axis to check distance.</param>
    /// <param name="maxDistance">Max distance.</param>
    /// <param name="offsetToSource">Offset to source.</param>
    public static bool IsObjectTooFarFromSourceInAxis(Transform source, Vector3[] objectColliderCorners,
        Vector3 axisToCheckDistance, float maxDistance, out float offsetToSource)
    {
        float distanceToGround = 0.0f;
        int offsetSign = 1;

        for (int i = 0; i < objectColliderCorners.Length; ++i)
        {
            Vector3 projection = Vector3.Project(objectColliderCorners[i] - source.position,
                                                    axisToCheckDistance);
            if (projection.magnitude > distanceToGround)
            {
                distanceToGround = projection.magnitude;
                offsetSign = Vector3.Dot(projection, axisToCheckDistance) > 0.0f
                    ? 1
                    : -1;
            }
        }
        float distanceDifference = distanceToGround - maxDistance;
        offsetToSource = distanceDifference * offsetSign;

        return distanceDifference > 0.0f;
    }

    /// <summary>
    /// Note that the right neighbour of the last index is the first index (and vice-versa).
    /// </summary>
    /// <param name="currentIndex"></param>
    /// <param name="increment">Look for the currentIndex + increment.</param>
    /// <param name="maxIndex"></param>
    /// <returns>The index of the wanted neighbour.</returns>
    public static int GetNeighbourIndex(int currentIndex, int maxIndex, int increment)
    {
        int newIndex = (currentIndex + increment) % (maxIndex + 1);

        if (newIndex < 0)
        {
            newIndex = maxIndex;
        }

        return newIndex;
    }

    /// <summary>
    /// Note that the right neighbour of the last index is the first index (and vice-versa).
    /// </summary>
    /// <param name="currentIndex"></param>
    /// <param name="maxIndex"></param>
    /// <param name="rightNeighbour">If true look for the currentIndex + 1; currentIndex - 1 otherwise.</param>
    /// <returns>The index of the wanted neighbour.</returns>
    public static int GetNearestNeighbourIndex(int currentIndex, int maxIndex, bool rightNeighbour = true)
    {
        int direction = rightNeighbour
            ? 1 : -1;

        int newIndex = (currentIndex + direction) % (maxIndex + 1);

        if (newIndex < 0)
        {
            newIndex = maxIndex;
        }

        return newIndex;
    }


    /// <summary>
    /// Note that the right neighbour of the last index is the first index (and vice-versa).
    /// </summary>
    /// <param name="currentIndex"></param>
    /// <param name="maxIndex"></param>
    /// <param name="startIndex"></param>
    /// <param name="rightNeighbour">If true look for the currentIndex + 1; currentIndex - 1 otherwise.</param>
    /// <returns>The index of the wanted neighbour.</returns>
    public static int GetNearestNeighbourIndex(int currentIndex, int maxIndex, int startIndex, bool rightNeighbour = true)
    {
        if (startIndex > maxIndex)
        {
            // Error.
            return -1;
        }

        int direction = rightNeighbour
            ? 1 : -1;

        int newIndex = (currentIndex + direction) % (maxIndex + 1);

        if (newIndex < 0)
        {
            newIndex = maxIndex;
        }
        if (newIndex < startIndex)
        {
            newIndex = GetNearestNeighbourIndex(newIndex, maxIndex, startIndex, rightNeighbour);
        }

        return newIndex;
    }

    /// <summary>
    /// Cast a ray to test if Input.mousePosition is over any UI object in EventSystem.current. This is a replacement
    /// for IsPointerOverGameObject() which does not work on Android since Unity 4.6.0f3.
    /// </summary>
    public static bool IsPointerOverUIObject()
    {
        // Referencing this code for GraphicRaycaster https://gist.github.com/stramit/ead7ca1f432f3c0f181f
        // the ray cast appears to require only eventData.position.
        PointerEventData eventDataCurrentPosition = new PointerEventData(EventSystem.current);
        eventDataCurrentPosition.position = new Vector2(Input.mousePosition.x, Input.mousePosition.y);

        List<RaycastResult> results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(eventDataCurrentPosition, results);

        return results.Count > 0;
    }
    #endregion Misc

    #region Extensions
    /// <summary>
    /// Enables or disable all children.
    /// </summary>
    /// <param name="parent">The parent.</param>
    /// <param name="enable">If set to <c>true</c> enables all children.
    /// \nDisables all children otherwise.</param>
    public static void EnableAllChildren(this Transform parent, bool enable = true)
    {
        if (parent == null)
        {
            return;
        }

        for (int i = 0; i < parent.childCount; ++i)
        {
            parent.GetChild(i).gameObject.SetActive(enable);
        }
    }

    /// <summary>
    /// Get a collection of all children of a transform.
    /// </summary>
    /// <param name="parent">Transform in wich we get the children.</param>
    /// <returns>An enumerable of Transform containing all children of "parent".</returns>
    public static IEnumerable<Transform> GetChildren(this Transform parent)
    {
        Transform[] children = new Transform[parent.childCount];

        for (int i = 0; i < parent.childCount; ++i)
        {
            children[i] = parent.GetChild(i);
        }

        return children;
    }

    /// <summary>
    /// Finds the 1st direct child with the specified tag.
    /// </summary>
    /// <returns>The 1st direct child with the specified tag.</returns>
    /// <param name="parent">The parent.</param>
    /// <param name="tag">The specified tag.</param>
    public static Transform FindChildWithTag(this Transform parent, string tag)
    {
        if (parent.childCount == 0)
        {
            return null;
        }

        for (int i = 0; i < parent.childCount; ++i)
        {
            if (parent.GetChild(i).gameObject.tag == tag)
            {
                return parent.GetChild(i);
            }
        }

        return null;
    }

    /// <summary>
    /// Finds all direct children with the specified tag.
    /// </summary>
    /// <returns>A collection of all direct children with the specified tag.</returns>
    /// <param name="parent">The parent.</param>
    /// <param name="tag">The specified tag.</param>
    public static IEnumerable<Transform> FindChildrenWithTag(this Transform parent, string tag)
    {
        if (parent.childCount == 0)
        {
            return null;
        }

        List<Transform> childrenWithTag = new List<Transform>();

        for (int i = 0; i < parent.childCount; ++i)
        {
            if (parent.GetChild(i).gameObject.tag == tag)
            {
                childrenWithTag.Add(parent.GetChild(i));
            }
        }

        if (childrenWithTag.Count == 0)
        {
            return null;
        }

        return childrenWithTag;
    }

    /// <summary>
    /// Determines if a float a is nearly equal the float b according to <seealso cref="Utils.c_FloatPrecision"/>.
    /// </summary>
    /// <returns><c>true</c> if a is nearly equal to b; otherwise, <c>false</c>.</returns>
    /// <param name="a">The first float.</param>
    /// <param name="b">The second float.</param>
    /// <param name="nearlyValue">The range used to determine what is "near".</param>
    public static bool IsNearlyEqualTo(this float a, float b, float nearlyValue = c_FloatPrecision)
    {
        return a >= b - nearlyValue
            && a <= b + nearlyValue;
    }

    /// <summary>
    /// Determines if a vector a is nearly equal the vector b according to <seealso cref="Utils.c_FloatPrecision"/>.
    /// </summary>
    /// <returns><c>true</c> if a is nearly equal to b; otherwise, <c>false</c>.</returns>
    /// <param name="a">The first vector.</param>
    /// <param name="b">The second vector.</param>
    /// <param name="nearlyValue">The range used to determine what is "near".</param>
    public static bool IsNearlyEqualTo(this Vector3 a, Vector3 b, float nearlyValue = c_FloatPrecision)
    {
        return a.x.IsNearlyEqualTo(b.x)
            && a.y.IsNearlyEqualTo(b.y)
            && a.z.IsNearlyEqualTo(b.z);
    }

    /// <summary>
    /// Rotates a transform so <paramref name="transformAxisToAlign"/> is coplanar to the plane.
    /// </summary>
    /// <param name="transformToRotate">Transform to rotate.</param>
    /// <param name="transformAxisToAlign">Transform's axis to align.</param>
    /// <param name="planeNormal">Plane normal.</param>
    public static void RotateToAlignWithPlaneAxis(this Transform transformToRotate,
        Vector3 transformAxisToAlign, Vector3 planeNormal)
    {
        Vector3 projectionOnGround = Vector3.ProjectOnPlane(transformAxisToAlign, planeNormal);
        projectionOnGround.Normalize();

        // If the projection is nearly equal to the vector then the vector is coplanar to the ground.
        if (!projectionOnGround.IsNearlyEqualTo(transformAxisToAlign))
        {
            float angleBetweenAxis = Vector3.Angle(transformAxisToAlign, projectionOnGround);

            transformToRotate.Rotate(
                Vector3.Cross(transformAxisToAlign, projectionOnGround),
                angleBetweenAxis,
                Space.World);
        }
    }

    /// <summary>
    /// Gets the corners of the box collider.
    /// </summary>
    /// <returns>A table containing the posotions of all corners.</returns>
    /// <param name="boxCollider">Box collider.</param>
    public static Vector3[] GetCorners(this BoxCollider boxCollider)
    {
        Vector3[] corners = new Vector3[8];
        float xOffset = boxCollider.transform.localScale.x * boxCollider.size.x * 0.5f;
        float yOffset = boxCollider.transform.localScale.y * boxCollider.size.y * 0.5f;
        float zOffset = boxCollider.transform.localScale.z * boxCollider.size.z * 0.5f;

        corners[0] = boxCollider.bounds.center
            - xOffset * boxCollider.transform.right
            - yOffset * boxCollider.transform.up
            - zOffset * boxCollider.transform.forward;
        corners[1] = boxCollider.bounds.center
            - xOffset * boxCollider.transform.right
            - yOffset * boxCollider.transform.up
            + zOffset * boxCollider.transform.forward;
        corners[2] = boxCollider.bounds.center
            + xOffset * boxCollider.transform.right
            - yOffset * boxCollider.transform.up
            + zOffset * boxCollider.transform.forward;
        corners[3] = boxCollider.bounds.center
            + xOffset * boxCollider.transform.right
            - yOffset * boxCollider.transform.up
            - zOffset * boxCollider.transform.forward;
        corners[4] = boxCollider.bounds.center
            + xOffset * boxCollider.transform.right
            + yOffset * boxCollider.transform.up
            - zOffset * boxCollider.transform.forward;
        corners[5] = boxCollider.bounds.center
            - xOffset * boxCollider.transform.right
            + yOffset * boxCollider.transform.up
            - zOffset * boxCollider.transform.forward;
        corners[6] = boxCollider.bounds.center
            - xOffset * boxCollider.transform.right
            + yOffset * boxCollider.transform.up
            + zOffset * boxCollider.transform.forward;
        corners[7] = boxCollider.bounds.center
            + xOffset * boxCollider.transform.right
            + yOffset * boxCollider.transform.up
            + zOffset * boxCollider.transform.forward;

        return corners;
    }
    #endregion Extensions
}
