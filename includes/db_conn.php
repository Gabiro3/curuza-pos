<?php

// Database connection details
$host = 'mysql';   // MySQL server running in the same container
$username = 'myuser';  // MySQL user from Dockerfile environment
$password = 'mypassword';  // MySQL password from Dockerfile environment
$database = 'mydatabase';  // MySQL database name from Dockerfile environment

// Connect to the MySQL server
$db = mysqli_connect($host, $username, $password, $database);

// Check connection
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}

// Optional: Set the character set to UTF-8
mysqli_set_charset($db, 'utf8');

// Success message (optional)
echo "Connected successfully to MySQL!";
?>