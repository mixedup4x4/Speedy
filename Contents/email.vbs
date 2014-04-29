 'Option Explicit
 
 Set objADSysInfo = CreateObject("ADSystemInfo")
 Set objUser = GetObject("LDAP://" & objADSysInfo.UserName)
 'WScript.Echo objUser.Mail

 
strSMTPFrom = "NSOC_SEC@epa.gov"
strSMTPTo = objUser.Mail
strSMTPRelay = "smtp.epa.gov"
strTextBody = "AutoMater Results are attached"
strSubject = "AutoMater Results"
strAttachment = "c:\users\Public\temp\AutoMaterResults.txt"


Set oMessage = CreateObject("CDO.Message")
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSMTPRelay
oMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
oMessage.Configuration.Fields.Update

oMessage.Subject = strSubject
oMessage.From = strSMTPFrom
oMessage.To = strSMTPTo
oMessage.TextBody = strTextBody
oMessage.AddAttachment strAttachment


oMessage.Send