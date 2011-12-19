<?php

$tempFile = $_FILES['Filedata']['tmp_name'];
$fileName = $_FILES['Filedata']['name'];
$fileSize = $_FILES['Filedata']['size'];

$archivo=fopen('/tmp/log.txt','w');
fwrite($archivo,"Subiendo Archivo $tempFile ->  $fileName ($fileSize  Bytes)");
fclose($archivo);

move_uploaded_file($tempFile, "/tmp/" . $fileName);

?>
