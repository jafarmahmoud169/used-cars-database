<html>

    <head>
        <meta charset="utf-8">
        <title>sam's used cars</title>
    </head>

    <body>
        <h1>SAM'S USED CARS</h1>
        <?php
        include 'db.php';
        $query = "select * from inventory ";
        if (!$result = $mysqli->query($query)) {
            echo "error getting cars from the dataabase " . mysqli_error($mysqli) . "<br>";
        }
        echo "<table border='1'>
            <caption>all cars</caption>
            <thead>
                <tr>
                    <th>MAKE</th>
                    <th>MODEL</th>
                    <th>ASKING PRICE</th>
                    <th>OPERATION</th>
                </tr>
            </thead>
            <tbody>";
        while ($result_ar = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td><a href='veiwcare.php?VIN=" . $result_ar['VIN'] . "'>" . $result_ar['Make'] . "</a>" . "</td>";
            echo "<td>" . $result_ar['Model'] . "</td>";
            echo "<td>" . $result_ar['ASKING_PRICE'] . "</td>";
            echo "<td>  <a href='editcarform.php?VIN=" . $result_ar['VIN'] . "'>edit</a>
                        <a href='deletecar.php?VIN=" . $result_ar['VIN'] . "'>delete</a>
                        <a href='addimageform.php?VIN=" . $result_ar['VIN'] . "'>addimage</a></td>";
            echo "</tr>";
        }
        echo "</tbody>
        </table>";
        $mysqli->close();
        ?>
    </body>

</html>