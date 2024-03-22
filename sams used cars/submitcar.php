<?php
$vin=$_GET['VIN'];
$model=$_GET['Model'];
$make=$_GET['Make'];
$price=$_GET['Asking_Price'];
// echo "vin= $vin";
// echo "model=$model";
$query="INSERT INTO inventory (vin,make,model,asking_price) 
VALUES ('$vin','$make','$model',$price)";
echo ($query ."<br>");
$mysqli = new mysqli('localhost:4000', 'root', 'your_password', 'cars');
if(mysqli_connect_errno()){
printf("connection failed: %s/n" ,mysqli_connect_error());
exit();
}
echo 'connected successfully to mysql. <BR>';
$mysqli->select_db("cars");
echo ("the cars database selected"."<br>");
if($result=$mysqli->query($query)){
    echo "<p>you have successfuly entered $make $model into the database</p>";
}
else{
    echo " error entering $make $model into the db"  . mysqli_error($mysqli). "<br>";
}
$mysqli->close();
?>
