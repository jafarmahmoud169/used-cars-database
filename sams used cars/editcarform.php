<html>

    <head>
        <title>editcar</title>
    </head>

    <body>
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
        $trim = $result_ar['TRIM'];
        $excolor = $result_ar['EXT_COLOR'];
        $incolor = $result_ar['INT_COLOR'];
        $mileage = $result_ar['MILEAGE'];
        $trans = $result_ar['TRANSMISSION'];
        $askprice = $result_ar['ASKING_PRICE'];

        echo "<form action='editcar.php' method='get'>
            vin:<input type='text'name='VIN'value=$vin><br>
            trim:<input type='text' name='TRIM'value=$trim><br>
            year:<input type='text' name='YEAR'value=$year><br>
            make:<input type='text' name='Make'value=$make><br>
            model:<input type='textL' name='Model'value=$model><br>
            ext_color:<input type='text' name='EXT_COLOR'value=$excolor><br>
            in_color:<input type='text' name='INT_COLOR'value=$incolor><br>
            mileage:<input type='text' name='MILEAGE'value=$mileage><br>
            rtans:<input type='text' name='TRANSMISSION'value=$trans><br>
            asking_price:<input type='text' name='ASKING_PRICE'value=$askprice><br>
            <input type='submit' name='submit'>"
            ?>
        </form>

    </body>

</html>