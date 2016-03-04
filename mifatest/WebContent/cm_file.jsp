<html>
<head>
<title>File Uploading Form</title>
</head>
<body>
<h3>Lade ein Bild hoch: (das Bild sollte schon zugeschnitten sein)</h3>
Select a file to upload: <br />
<form action="uploadFile.jsp" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</body>
</html>