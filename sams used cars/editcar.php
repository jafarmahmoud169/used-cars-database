<?php
include 'db.php';
$vin = $_GET['VIN'];
$year = $_GET['YEAR'];
$make = $_GET['Make'];
$model = $_GET['Model'];
$trim = $_GET['TRIM'];
$excolor = $_GET['EXT_COLOR'];
$incolor = $_GET['INT_COLOR'];
$mileage = $_GET['MILEAGE'];
$trans = $_GET['TRANSMISSION'];
$askprice = $_GET['ASKING_PRICE'];

$query = "update inventory set YEAR='$year',Make='$make',Model='$model',TRIM='$trim',EXT_COLOR='$excolor',
INT_COLOR='$incolor',MILEAGE='$mileage',TRANSMISSION='$trans',ASKING_PRICE='$askprice' where VIN='$vin'";
if ($rerult = $mysqli->query($query)) {
    echo "THE CAR WITH VIN OF $vin HAS BEEN EDITED SUCCESSFULY";
    echo "<a href=veiwcare.php?VIN=$vin>veiw car detailes after editing</a>";
} else {
    echo "THE CAR CAN NOT BE EDITED" . mysqli_errno($mysqli);
}
?>