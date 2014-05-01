'Email the files
strFolder = "C:\Users\Public\temp"
strExt = "txt"

Set objADSysInfo = CreateObject("ADSystemInfo")
Set objUser = GetObject("LDAP://" & objADSysInfo.UserName)
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder(strFolder)
Set objMessage = CreateObject("CDO.Message")

strSMTPTo = objUser.Mail

objMessage.Subject = "AutoMater Results"
objMessage.From = "NSOC_Sec@epa.gov"
objMessage.To = strSMTPTo
objMessage.TextBody = "AutoMater Results"
For Each objFile In objFolder.Files
strFileExt = objFSO.GetExtensionName(objFile.Path)
objMessage.AddAttachment objFile.Path
msgbox "Got file!"
Next
MsgBox "Finished! An email is being sent"

'Configuration Info
objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
'Name or IP of Remote SMTP Server
objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.epa.gov"
'Server port (typically 25)
objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
objMessage.Configuration.Fields.Update
'==End remote SMTP server configuration section==
objMessage.Send


