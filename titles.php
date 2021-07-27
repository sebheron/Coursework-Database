<?php

    function displayTitle($table_name)
    {
        echo '<div class="container"><a href="index.php?table=' . $table_name . '"><h1 style="text-align:center;color:white">' . getTitle($table_name) . '</h1></a></div>';
    }

    function getTitle($table_name)
    {
        $title = "Branches";
        switch ($table_name)
        {
            case 'employee':
                $title = "Employees";
                break;
            case 'room':
                $title = "Rooms";
                break;
            case 'customer':
                $title = "Customers";
                break;
            case 'booking':
                $title = "Bookings";
                break;
            case 'supplier':
                $title = "Suppliers";
                break;
            case 'product':
                $title = "Products";
                break;
        }
        return $title;
    }
?>