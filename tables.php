<?php
    function _createTable($connection, $sql, $table, $query, $val, $order) {
        $statement = oci_parse($connection, $sql);
        $success = oci_execute($statement);
        if ($success == true)
        {
            $numcols = oci_num_fields($statement);
            echo '<table class="table table-dark"><tr>';

            for ($i = 1;$i <= $numcols;$i++)
            {
                $colname = oci_field_name($statement, $i);
                $link = "index.php?table=$table";
                if ($i > 1)
                {
                    $link .= "&order=$colname" . getQueryLink($query, $val);
                }
                echo '<td><a style="color:#DDD" title="Sort by ' . $colname . '" style="color:white" href="' . $link . '">' . $colname . '</a></td>';
            }

            echo "</tr>";
            
            while (oci_fetch($statement))
            {
                echo "<tr>";
                for ($i = 1;$i <= $numcols;$i++)
                {
                    $col = oci_result($statement, $i);
                    $link = "index.php?table=$table&query=" . strtolower(oci_field_name($statement, $i)) . '&val=' . $col . getOrderLink($order);
                    echo '<td><a style="color:white" href="' . $link . '">' . $col . '</a></td>';
                }
                echo "</tr>";
            }
            echo "</table>";
            $numrows = oci_num_rows($statement);
            echo "$numrows entries are available.<br> \n";
        }
    }

    function displayStandardRoomTable($connection, $table, $query, $val, $order)
    {
        $sql = "select room.* from room inner join standardroom on room.roomno = standardroom.roomno";
        $sql .= getExtras($query, $val, $order);
        _createTable($connection, $sql, $table, $query, $val, $order);
    }


    function displayExecutiveRoomTable($connection, $table, $query, $val, $order)
    {
        $sql = "select room.*, executiveroom.wifiaccesscode from room inner join executiveroom on room.roomno = executiveroom.roomno";
        $sql .= getExtras($query, $val, $order);
        _createTable($connection, $sql, $table, $query, $val, $order);
    }

    function displayStandardCustomerTable($connection, $table, $query, $val, $order)
    {
        $sql = "select customer.*, standardcustomer.firstname, standardcustomer.lastname from customer inner join standardcustomer on customer.customerno = standardcustomer.customerno";
        $sql .= getExtras($query, $val, $order);
        _createTable($connection, $sql, $table, $query, $val, $order);
    }

    function displayBusinessCustomerTable($connection, $table, $query, $val, $order)
    {
        $sql = "select customer.*, businesscustomer.name, businesscustomer.street, businesscustomer.city, businesscustomer.postcode from customer inner join businesscustomer on customer.customerno = businesscustomer.customerno";
        $sql .= getExtras($query, $val, $order);
        _createTable($connection, $sql, $table, $query, $val, $order);
    }

    function displayTable($connection, $table, $query, $val, $order)
    {
        $sql = "select * from " . $table;
        $sql .= getExtras($query, $val, $order);
        _createTable($connection, $sql, $table, $query, $val, $order);
    }

    function getExtras($query, $val, $order)
    {
        $sql = "";
        if (isset($query) && isset($val))
        {
            $sql .= " where $query = '$val'";
        }
        if (isset($order))
        {
            $sql .= " order by $order asc";
        }
        return $sql;
    }

    function getQueryLink($query, $val)
    {
        $link = "";
        if (isset($query) && isset($val))
        {
            $link .= "&query=$query&val=$val";
        }
        return $link;
    }

    function getOrderLink($order)
    {
        $link = "";
        if (isset($order))
        {
            $link .= "&order=$order";
        }
        return $link;
    }
?>