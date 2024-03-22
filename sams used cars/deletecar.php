<?php
include 'db.php';
$VIN = $_GET['VIN'];
$query="delete from inventory where VIN='$VIN'";
if($result=$mysqli->query($query)){
    echo "car with VIN of $VIN has been deleted";
}
else{
    echo "car with VIN of $VIN can not be deleted".mysqli_error($mysqli);
}

?>