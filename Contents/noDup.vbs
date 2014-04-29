Const adOpenStatic = 3
Const adLockOptimistic = 3
Const adCmdText = &H0001

'Set wshNetwork = CreateObject("WScript.Network")
'strUser = wshNetwork.Username

'Set objConnection = CreateObject("ADODB.Connection")
'Set objRecordSet = CreateObject("ADODB.Recordset")

strPathToTextFile = "C:\Users\Jchapell\Desktop\Proxies\"
strFile = "WorkingProxies.txt"

objConnection.Open "Provider=Microsoft.Jet.OLEDB.4.0;" & _
      "Data Source=" & strPathtoTextFile & ";" & _
          "Extended Properties=""text;HDR=NO;FMT=Delimited"""

objRecordSet.Open "Select DISTINCT * FROM " & strFile, _
    objConnection, adOpenStatic, adLockOptimistic, adCmdText

Do Until objRecordSet.EOF
    Wscript.Echo objRecordSet.Fields.Item(0).Value   
    objRecordSet.MoveNext
Loop