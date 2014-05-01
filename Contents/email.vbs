

Set objADSysInfo = CreateObject("ADSystemInfo")
Set objUser = GetObject("LDAP://" & objADSysInfo.UserName)



strSMTPFrom = "NSOC_SEC@epa.gov"
strSMTPTo = objUser.Mail
strSMTPRelay = "smtp.epa.gov"
strTextBody = "AutoMater Results are attached"
strSubject = "AutoMater Results"
'strAttachment = "c:\users\Public\temp\*.txt"

Set oMessage = CreateObject("CDO.Message")
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSMTPRelay
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
oMessage.Configuration.Fields.Update

oMessage.Subject = strSubject
oMessage.From = strSMTPFrom
oMessage.To = strSMTPTo
oMessage.TextBody = strTextBody
'oMessage.AddAttachment strAttachment
objMessage.AddAttachment findfile("c:\Users\Public\temp", "-BR.txt")
oMessage.Send

Function findfile(strFolder, strFileName)
Dim fso
Dim fil

    Set fso = CreateObject("scripting.filesystemobject")
    For Each fil In fso.getfolder(strFolder).Files
        If LCase(fil.Name) Like "*" & strFileName Then
            findfile = fil.Path
        End If
    Next
End Function