<?php
$vin = $_POST['VIN'];
if ($_FILES['image']['error'] > 0) {
    echo "error:" . $_FILES['image']['error'] . "<br>";
} else {
    $imagename = $_FILES['image']['name'];
    $size = $_FILES['image']['size'];
    $type = $_FILES['image']['type'];
    $stored_as_tmp = $_FILES['image']['tmp_name'];
    echo "uploaded:" . $imagename . "<br>";
    echo "TYPE:" . $type . "<br>";
    echo "SIZE:" . $size / 1024 . "KB<br>";
    echo "STORED TEMPORARLY AS:" . $stored_as_tmp . "<br>";
    echo "VIN:" . $vin . "<br>";

    $currentfolder = getcwd();
    echo "the current folder is :" . $currentfolder . "<br>";
    $targetpath = getcwd() . "\images/";
    echo "THE IMAGE WILL BE STORED in:" . $targetpath . "<br>";
    $targetpath = $targetpath . basename($_FILES["image"]['name']);
    if (move_uploaded_file($stored_as_tmp, $targetpath)) {
        echo "THE IMAGE UPLOADED SUCCESFULY TO : " . $targetpath . "<br>";
    } else {
        echo "error in moving";
    }
    include 'db.php';
    $query = "INSERT INTO images (VIN,ImageFile) VALUES ('$vin','$imagename')";
    if ($result = $mysqli->query($query)) {
        echo "entered $imagename succesfuly to the database" . "<br>";
    } else {
        echo "error entering $imagename to the database" . mysqli_error($mysqli);
    }
    $mysqli->close();
}
?>