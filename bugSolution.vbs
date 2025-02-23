Function CheckObject(obj)
  If obj Is Nothing Then
    Err.Raise vbObjectError + 1, , "Object is Nothing"
  End If
  ' Add other checks as needed
End Function

Sub Main()
  Dim obj As Object
  Set obj = CreateObject("Scripting.FileSystemObject")

  ' Incorrect way to handle potential errors:
  'On Error Resume Next
  'Dim fileExists As Boolean
  'fileExists = obj.FileExists("nonexistent.txt")
  'If Err.Number <> 0 Then
  '  MsgBox "Error: " & Err.Description
  'End If
  'On Error GoTo 0

  'Corrected way to handle potential errors using CheckObject
  If CheckObject(obj) Then
    Dim fileExists As Boolean
    fileExists = obj.FileExists("test.txt")
    If fileExists Then
      MsgBox "File exists"
    Else
      MsgBox "File does not exist"
    End If
  End If

  Set obj = Nothing
End Sub