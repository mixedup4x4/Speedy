Dim xmlDocument, xmlStylesheet

Set xmlDocument = CreateObject("Msxml2.DOMDocument")
xmlDocument.async = False
xmlDocument.validateOnParse = True
xmlDocument.load "dbsha.xml"

Set xmlStylesheet = CreateObject("Msxml2.DOMDocument")
xmlStylesheet.async = False
xmlStylesheet.validateOnParse = True
xmlStylesheet.load "dbsha.xsl"

wscript.echo xmlDocument.transformNode(xmlStylesheet)

Set xmlDocument = Nothing
Set xmlStylesheet = Nothing
