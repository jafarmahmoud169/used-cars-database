<?php
if ($_FILES["file"]["error"] > 0) {
    echo "error:" . $_FILES["file"]["error"] . "<BR>";
} else {
    echo "upload:" . $_FILES["file"]["name"] . "<BR>";
    echo "type:" . $_FILES["file"]["type"] . "<BR>";
    echo "size:" . ($_FILES["file"]["size"] / 1024) . "KB<BR>";
    echo "stored in:" . $_FILES["file"]["tmp_name"] . "<BR>";
}
?>