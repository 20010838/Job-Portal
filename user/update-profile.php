<?php

//To Handle Session Variables on This Page
session_start();

if(empty($_SESSION['id_user'])) {
  header("Location: ../index.php");
  exit();
}

//Including Database Connection From db.php file to avoid rewriting in all files
require_once("../db.php");

// nếu người dùng Thực sự đã nhấp vào nút cập nhật hồ sơ
if(isset($_POST)) {

	//Escape Special Characters
	$firstname = mysqli_real_escape_string($conn, $_POST['fname']);
	$lastname = mysqli_real_escape_string($conn, $_POST['lname']);
	$address = mysqli_real_escape_string($conn, $_POST['address']);
	$city = mysqli_real_escape_string($conn, $_POST['city']);

	$contactno = mysqli_real_escape_string($conn, $_POST['contactno']);
	$qualification = mysqli_real_escape_string($conn, $_POST['qualification']);

	$skills = mysqli_real_escape_string($conn, $_POST['skills']);
	$aboutme = mysqli_real_escape_string($conn, $_POST['aboutme']);

	$uploadOk = true;

	if(isset($_FILES)) {

		$folder_dir = "../uploads/resume/";

		$base = basename($_FILES['resume']['name']); 

		$resumeFileType = pathinfo($base, PATHINFO_EXTENSION); 

		$file = uniqid() . "." . $resumeFileType;   

		$filename = $folder_dir .$file;  

		if(file_exists($_FILES['resume']['tmp_name'])) { 
			
			if($resumeFileType == "pdf")  {

				if($_FILES['resume']['size'] < 10000000) { // File size is less than 5MB

					move_uploaded_file($_FILES["resume"]["tmp_name"], $filename);

				} else {
					$_SESSION['uploadError'] = "Wrong Size. Max Size Allowed : 10MB";
					header("Location: edit-profile.php");
					exit();
				}
			} else {
				$_SESSION['uploadError'] = "Wrong Format. Only PDF Allowed";
				header("Location: edit-profile.php");
				exit();
			}
		}
	} else {
		$uploadOk = false;
	}

	

// Cập nhật truy vấn chi tiết người dùng
	$sql = "UPDATE users SET firstname='$firstname', lastname='$lastname', address='$address', city='$city', contactno='$contactno', qualification='$qualification',  skills='$skills', aboutme='$aboutme'";

	if($uploadOk == true) {
		$sql .= ", resume='$file'";
	}

	$sql .= " WHERE id_user='$_SESSION[id_user]'";

	if($conn->query($sql) === TRUE) {
		$_SESSION['name'] = $firstname.' '.$lastname;
		// Nếu dữ liệu được cập nhật thành công thì chuyển hướng đến trang tổng quan
		header("Location: index.php");
		exit();
	} else {
		echo "Error ". $sql . "<br>" . $conn->error;
	}
	//Close database connection. Not compulsory but good practice.
	$conn->close();

} else {
	//redirect them back to dashboard page if they didn't click update button
	header("Location: edit-profile.php");
	exit();
}