<?php

//To Handle Session Variables on This Page
session_start();

//Including Database Connection From db.php file to avoid rewriting in all files
require_once("db.php");

//If user Actually clicked login button 
if(isset($_POST)) {

	//Escape Special Characters in String
	$email = mysqli_real_escape_string($conn, $_POST['email']);
	$password = mysqli_real_escape_string($conn, $_POST['password']);

	//Encrypt Password
	$password = base64_encode(strrev(md5($password)));

	//sql query to check company login
	$sql = "SELECT id_company, companyname, email, active FROM company WHERE email='$email' AND password='$password'";
	$result = $conn->query($sql);

	//if company table has this this login details
	if($result->num_rows > 0) {
		//output data
		while($row = $result->fetch_assoc()) {

			if($row['active'] == '2') {
				$_SESSION['companyLoginError'] = "Tài khoản của bạn vẫn đang được quản trị viên phê duyệt.";
				header("Location: login-company.php");
				exit();
			} else if($row['active'] == '0') {
				$_SESSION['companyLoginError'] = "Tài khoản của bạn bị từ chối. Vui lòng liên hệ với quản trị viên để biết thêm thông tin.";
				header("Location: login-company.php");
				exit();
			} else if($row['active'] == '1') {
				// active 1 means admin has approved account.
				//Set some session variables for easy reference
				$_SESSION['name'] = $row['companyname'];
				$_SESSION['id_company'] = $row['id_company'];

				//Redirect them to company dashboard once logged in successfully
				header("Location: company/index.php");
				exit();
			} else if($row['active'] == '3') {
				$_SESSION['companyLoginError'] = "Tài khoản của bạn bị vô hiệu hóa. Liên hệ với quản trị viên để kích hoạt lại.";
				header("Location: login-company.php");
				exit();
			}
		}
 	} else {
 		//if no matching record found in user table then redirect them back to login page
 		$_SESSION['loginError'] = $conn->error;
 		header("Location: login-company.php");
		exit();
 	}

 	//Close database connection. Not compulsory but good practice.
 	$conn->close();

} else {
	//redirect them back to login page if they didn't click login button
	header("Location: login-company.php");
	exit();
}