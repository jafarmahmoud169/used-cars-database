<html>

    <head>
        <title>viewcar</title>
    </head>

    <body>
        <h1>SAM'S USED CARS</h1>
        <?php
        include 'db.php';
        $VIN = $_GET['VIN'];
        $query = "select * from inventory where VIN='$VIN'";
        if (!$result = $mysqli->query($query)) {
            echo "A car with VIN of $VIN can not be found " . mysqli_error($mysqli) . "<br>";
        }
        while ($result_ar = mysqli_fetch_assoc($result)) {
            $year = $result_ar['YEAR'];
            $make = $result_ar['Make'];
            $model = $result_ar['Model'];
            $trim = $result_ar['TRIM'];
            $excolor = $result_ar['EXT_COLOR'];
            $incolor = $result_ar['INT_COLOR'];
            $mileage = $result_ar['MILEAGE'];
            $trans = $result_ar['TRANSMISSION'];
            $askprice = $result_ar['ASKING_PRICE'];
            //$image = $result_ar['Primary_Image'];
        }
        echo "<H1>$make $model $year</H1>";
        echo "<P>VIN:$VIN<P>";
        echo "<P>EXT_COLORE: $excolor</P> ";
        echo "<P>IN_COLORE: $incolor</P> ";
        echo "<P>TIRM: $trim</P> ";
        echo "<P>MILEAGE: $mileage</P> ";
        echo "<P>TRANSMISSION: $trans</P> ";
        echo "<P>ASKING_PRICE: $askprice</P> ";
        //echo "<img src='images/$image'>";
        $query1 = "select * from images where VIN='$VIN'";
        if (!$result1 = $mysqli->query($query1)) {
            echo "A carIMAGE with VIN of $VIN can not be found " . mysqli_error($mysqli) . "<br>";
        }
        while ($result1_ar = mysqli_fetch_assoc($result1)) {
            $image = $result1_ar['ImageFile'];
            echo "<img src='images/$image' width='250'>";
        }
        $mysqli->close();
        ?>

    </body>

</html>