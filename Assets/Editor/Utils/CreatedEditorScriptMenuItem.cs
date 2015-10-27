using UnityEngine;
using UnityEditor;
using System.IO;
using System.Text;

public static class CreatedEditorScriptMenuItem
{
	const string EMPTY_FILE = @"using UnityEngine;
using UnityEditor;

[CustomEditor(typeof($))]
public class $Editor : Editor
{
	public override void OnInspectorGUI()
	{
		base.OnInspectorGUI();
	}
}
";

	[MenuItem("Assets/Create/C# Editor Script", false, 81)]
	static void CreateEditorScript()
	{
		var path = AssetDatabase.GetAssetPath(Selection.activeObject);
		var ext = Path.GetExtension(path);
		path = path.Replace(ext, "Editor" + ext);

		var text = EMPTY_FILE.Replace("$", Selection.activeObject.name);
		File.WriteAllText(path, text);

		AssetDatabase.ImportAsset(path);
	}
	[MenuItem("Assets/Create/C# Editor Script", true, 81)]
	static bool ValidateCreateEditorScript()
	{
		if (Selection.activeObject is MonoScript)
		{
			var path = AssetDatabase.GetAssetPath(Selection.activeObject);
			var ext = Path.GetExtension(path);
			if (!path.EndsWith("Editor" + ext))
			{
				path = path.Replace(ext, "Editor" + ext);
				return AssetDatabase.LoadAssetAtPath(path, typeof(MonoScript)) == null;
			}
		}
		return false;
	}
}