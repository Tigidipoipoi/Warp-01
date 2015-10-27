using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(CustomCameraRotation))]
[CanEditMultipleObjects]
public class CustomCameraRotationEditor : Editor
{
    #region Members
    private CustomCameraRotation p_InspectedScript
    {
        get
        {
            return (CustomCameraRotation)serializedObject.targetObject;
        }
    }

    private SerializedProperty m_EnableVerticalRotation;
    private SerializedProperty m_InvertHorizontalRotation;
    private SerializedProperty m_InvertVerticalRotation;
    private SerializedProperty m_HoriztontalRotationSpeed;
    private SerializedProperty m_VerticalRotationSpeed;
    private SerializedProperty m_MaxAngleUp;
    private SerializedProperty m_MaxAngleDown;
    private SerializedProperty m_VerticalResetCameraButton;
    #endregion Members

    public void OnEnable()
    {
        m_EnableVerticalRotation = serializedObject.FindProperty("m_EnableVerticalRotation");
        m_InvertHorizontalRotation = serializedObject.FindProperty("m_InvertHorizontalRotation");
        m_InvertVerticalRotation = serializedObject.FindProperty("m_InvertVerticalRotation");
        m_HoriztontalRotationSpeed = serializedObject.FindProperty("m_HoriztontalRotationSpeed");
        m_VerticalRotationSpeed = serializedObject.FindProperty("m_VerticalRotationSpeed");
        m_MaxAngleUp = serializedObject.FindProperty("m_MaxAngleUp");
        m_MaxAngleDown = serializedObject.FindProperty("m_MaxAngleDown");
        m_VerticalResetCameraButton = serializedObject.FindProperty("m_VerticalResetCameraButton");
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        EditorGUILayout.PropertyField(m_EnableVerticalRotation);
        EditorGUILayout.PropertyField(m_InvertHorizontalRotation);
        EditorGUILayout.PropertyField(m_HoriztontalRotationSpeed);

        if (p_InspectedScript.m_EnableVerticalRotation)
        {
            EditorGUILayout.PropertyField(m_InvertVerticalRotation);
            EditorGUILayout.PropertyField(m_VerticalRotationSpeed);
            EditorGUILayout.PropertyField(m_MaxAngleUp);
            EditorGUILayout.PropertyField(m_MaxAngleDown);
            EditorGUILayout.PropertyField(m_VerticalResetCameraButton);
        }

        serializedObject.ApplyModifiedProperties();
    }
}
