<?php

// MySQL host is 'localhost' when both MySQL and PHP are in the same container
$db = mysqli_connect('127.0.0.1', 'root', 'rootpassword', 'store_db');

// Check connection
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";

?>