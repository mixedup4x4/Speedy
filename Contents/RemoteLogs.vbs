'==========================================================================
'
' Event Log Monitor - Pull And Email
'
' COMMENT: Pulls Back Event Logs From Server Based On EventCode
'          and emails log file.  Will Only Pull Records From 24 Hours Ago
'==========================================================================
Dim Stuff, myFSO, WriteStuff, dateStamp, EventDate, DateNow, FileName, EventCode
Dim EmailAddress, SMTPServer
'==========================================================================
'Here Is Your Config Variables
SMTPServer = "smtp.epa.gov" 'Change This To Your SMTP Server
EmailAddress = "chapell.jason@epa.gov" 'Change This To Your Email Address
EventCode = "4625" 'Change This To Your Event Code You Wish To Pull
'==========================================================================

DateNow = Now()
FileName = WScript.Arguments(0) &amp; "_EventLog_Capture.txt"
 
Set myFSO = CreateObject("Scripting.FileSystemObject")
'Delete The File If Already Exists
If MyFSO.FileExists(FileName) Then
	myFSO.DeleteFile FileName
End If
Set WriteStuff = myFSO.OpenTextFile(FileName, 8, True)
 
'Get The Computer Name
strComputer = WScript.Arguments(0)
Set objWMIService = GetObject("winmgmts:" _
    &amp; "{impersonationLevel=impersonate}!\\" &amp; strComputer &amp; "\root\cimv2")
 
Set colLoggedEvents = objWMIService.ExecQuery _
    ("Select  * from Win32_NTLogEvent Where EventCode = ' " &amp; EventCode &amp; "'")
 
    'Setup The Header
	WriteStuff.WriteLine("Event Log Monitor - Pull And Email")
	WriteStuff.WriteLine("Written By Jason Chapell")
	WriteStuff.WriteLine(" ")
	WriteStuff.WriteLine("Server: " &amp; WScript.Arguments(0))
	WriteStuff.WriteLine(" ")
 
'Write The .TXT File Information
For Each objEvent in colLoggedEvents
	EventDate = GetVBDate(objEvent.TimeGenerated)
If DateDiff("h",DateNow,EventDate) &gt; -24 Then
 
    WriteStuff.WriteLine("================================================")
    WriteStuff.WriteLine("Event date: " &amp; EventDate)
    WriteStuff.WriteLine("Description: " &amp; objEvent.Message)
    WScript.Echo "================================================"
    Wscript.Echo "Event date: " &amp; EventDate
    Wscript.Echo "Description: " &amp; objEvent.Message
 
    End If
 
Next
 
WriteStuff.Close
SET WriteStuff = NOTHING
SET myFSO = Nothing
 
Call Send_Email
WScript.Echo "Finished!"
 
'=================== Functions ================================
Function GetVBDate(wd)
  GetVBDate = DateSerial(left(wd,4),mid(wd,5,2),mid(wd,7,2))+ TimeSerial(mid(wd,9,2),mid(wd,11,2),mid(wd,13,2))
End Function
 
Public Sub Send_Email
Set objMessage = CreateObject("CDO.Message")
objMessage.Subject = WScript.Arguments(0) &amp; " - Event Log Monitor - Pull And Email - Past 24 Hours"
objMessage.From = "NSOC_SEC@epa.gov"
objMessage.AddAttachment = FileName
objMessage.To = EmailAddress
objMessage.TextBody = "Events For " &amp; WScript.Arguments(0) &amp; " Within The Last 24 Hours"
 
'==This section provides the configuration information for the remote SMTP server.
'==Normally you will only change the server name or IP.
objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
'Name or IP of Remote SMTP Server
objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") = SMTPServer
'Server port (typically 25)
objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
objMessage.Configuration.Fields.Update
'==End remote SMTP server configuration section==
objMessage.Send
 
End Sub