<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>EASE Ltd.</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
	</head>
    <body style="background-color:#222;color:white;">
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <a style="color:#AAA" class="navbar-brand" href="index.php">EASE Ltd.</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a style="color:#AAA" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tables</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="index.php?table=branch">Branches</a>
                            <a class="dropdown-item" href="index.php?table=employee">Employees</a>
                            <a class="dropdown-item" href="index.php?table=room">All Rooms</a>
                            <a class="dropdown-item" href="index.php?table=standardroom">Standard Rooms</a>
                            <a class="dropdown-item" href="index.php?table=executiveroom">Executive Rooms</a>
                            <a class="dropdown-item" href="index.php?table=customer">All Customers</a>
                            <a class="dropdown-item" href="index.php?table=standardcustomer">Standard Customers</a>
                            <a class="dropdown-item" href="index.php?table=businesscustomer">Business Customers</a>
                            <a class="dropdown-item" href="index.php?table=booking">Bookings</a>
                            <a class="dropdown-item" href="index.php?table=supplier">Suppliers</a>
                            <a class="dropdown-item" href="index.php?table=product">Products</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    <!-- Top of page. -->
<?php
require 'tables.php';
require 'titles.php';

$table_values = array('branch', 'employee', 'room', 'standardroom', 'executiveroom', 'customer', 'standardcustomer', 'businesscustomer', 'booking', 'supplier', 'product');

$table = 'branch';
if (isset($_GET['table']))
{
    $temp_table = $_GET['table'];
    if (!in_array($temp_table, $table_values)){
        echo '<div class="alert alert-warning" role="alert">Table requested does not exist. Defaulting to branch table.</div>';
    }
    else {
        $table = $temp_table;
    }
}

putenv("ORACLE_SID=teaching");
if ($connection = oci_connect("x1f52", "sqlPlus10"))
{
    displayTitle($table);

    echo '<div style="margin:20px auto" class="container">';

    $query = null;
    $val = null;
    if (isset($_GET['query']) && isset($_GET['val']))
    {
        $query = $_GET['query'];
        $val = $_GET['val'];
    }

    $order = null;
    if (isset($_GET['order']))
    {
        $order = $_GET['order'];
    }

    if ($table == 'standardroom')
    {
        displayStandardRoomTable($connection, $table, $query, $val, $order);
    }
    else if ($table == 'executiveroom')
    {
        displayExecutiveRoomTable($connection, $table, $query, $val, $order);
    }
    else if ($table == 'standardcustomer')
    {
        displayStandardCustomerTable($connection, $table, $query, $val, $order);
    }
    else if ($table == 'businesscustomer')
    {
        displayBusinessCustomerTable($connection, $table, $query, $val, $order);
    }
    else {
        displayTable($connection, $table, $query, $val, $order);
    }
    
    oci_close($connection);
}
else
{
    var_dump(oci_error($connection));
}

?>
        <!-- End of page. -->
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>