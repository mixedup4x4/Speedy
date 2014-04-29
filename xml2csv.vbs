Dim writer As New CsvWriter("dbsha.csv")
Dim reader As New XmlRecordReader("dbsha.xml", "dbsha/dbsha")

reader.Columns.Add("name", "Name")
reader.Columns.Add("SHA1", "SHA1")
reader.Columns.Add("last_name", "last")

writer.Write("name")
writer.Write("SHA1")

writer.EndRecord()

While reader.ReadRecord()
	writer.Write(reader.Item("Name"))
	writer.Write(reader.Item("SHA1"))

	writer.EndRecord()
End While

reader.Close()
writer.Close()

end
