<?php

//Your Mysql Config
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_job";

//Create New Database Connection
$conn = new mysqli($servername, $username, $password, $dbname);
mysqli_set_charset($conn, 'UTF8');
//Check Connection
if($conn->connect_error) {
	die("Connection Failed: ". $conn->connect_error);
}