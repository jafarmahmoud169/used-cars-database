<?PHP
$vin = $_GET['VIN'];
include 'db.php';
$query = "select * from inventory where VIN='$vin' ";
if (!$result = $mysqli->query($query)) {
    echo "error getting cars from the dataabase " . mysqli_error($mysqli) . "<br>";
}
$result_ar = mysqli_fetch_assoc($result);
$year = $result_ar['YEAR'];
$make = $result_ar['Make'];
$model = $result_ar['Model'];
$excolor = $result_ar['EXT_COLOR'];
$incolor = $result_ar['INT_COLOR'];

echo "<h1>Add Image</h1>
<h2>$make $model $year</h2>
<P>EXT_COLORE: $excolor</P>
<P>IN_COLORE: $incolor</P>
<form action='addimage.php' method='post' enctype='multipart/form-data'>
    <label for='image'>NEW IMAGE</label>
    <input type='file' name='image'><br>
    <input type='text' name='VIN' hidden value='$vin'>
    <input type='submit' value='submit'>
    </form>";

?>