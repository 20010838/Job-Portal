<?php

//To Handle Session Variables on This Page
session_start();

//If user Not logged in then redirect them back to homepage. 
if(empty($_SESSION['id_company'])) {
  header("Location: ../index.php");
  exit();
}

require_once("../db.php");
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tuyển dụng</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../css/AdminLTE.min.css">
  <link rel="stylesheet" href="../css/_all-skins.min.css">
  <!-- Custom -->
  <link rel="stylesheet" href="../css/custom.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index.php" class="logo logo-bg">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>J</b>P</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Tuyển</b> Dụng</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
                   
        </ul>
      </div>
    </nav>
  </header>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="margin-left: 0px;">

    <section id="candidates" class="content-header">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="box box-solid">
              <div class="box-header with-border">
                <h3 class="box-title">Welcome <b><?php echo $_SESSION['name']; ?></b></h3>
              </div>
              <div class="box-body no-padding">
                <ul class="nav nav-pills nav-stacked">
                  <li><a href="index.php"><i class="fa fa-dashboard"></i> Bảng điều khiển</a></li>
                  <li> <a href="edit-company.php"><i class="fa fa-tv"></i> Công ty của tôi</a></li>
                  <li><a href="create-job-post.php"><i class="fa fa-file-o"></i> Tạo bài đăng tuyển dụng</a></li>
                  <li class="active"><a href="my-job-post.php"><i class="fa fa-file-o"></i> Bài đăng của tôi</a></li>
                  <li><a href="job-applications.php"><i class="fa fa-file-o"></i> Đơn xin việc</a></li>
                  <li><a href="mailbox.php"><i class="fa fa-envelope"></i> Hộp thư</a></li>
                  <li><a href="settings.php"><i class="fa fa-gear"></i> Cài đặt</a></li>
                  <li><a href="resume-database.php"><i class="fa fa-user"></i> Hồ sơ ứng viên</a></li>
                  <li><a href="../logout.php"><i class="fa fa-arrow-circle-o-right"></i> Đăng xuất</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-9 bg-white padding-2">
            <h2><i>Thông tin công ty</i></h2>
            <p>Chỉnh sửa thông tin công ty</p>
            <div class="row">
              <form action="update-job.php" method="post" enctype="multipart/form-data">
                <?php
                $sql = "SELECT * FROM job_post WHERE id_company='$_SESSION[id_company]'";
                $result = $conn->query($sql);

                if($result->num_rows > 0) {
                  while($row = $result->fetch_assoc()) {
                ?>
               <div class="col-md-9 bg-white padding-2">
            <h2><i>Tạo bài đăng tuyển dụng</i></h2>
            <div class="row">
              <form method="post" action=" update-job.php">
                <div class="col-md-12 latest-job ">
                  <div class="form-group">
                    <input class="form-control input-lg" type="text" id="jobtitle" name="jobtitle"  value="<?php echo $row['jobtitle']; ?>">
                  </div>
                  <div class="form-group">
                    <input class="form-control input-lg" id="description" name="description"  value="<?php echo $row['description']; ?>">
                  </div>
                  <div class="form-group">
                    <input type="number" class="form-control  input-lg" id="minimumsalary" min="1000000" step="500000" autocomplete="off" name="minimumsalary" value="<?php echo $row['minimumsalary']; ?>" required="">
                  </div>
                  <div class="form-group">
                    <input type="number" class="form-control  input-lg" id="maximumsalary" name="maximumsalary" min="1000000" step="500000" value="<?php echo $row['maximumsalary']; ?>" required="">
                  </div>
                  <div class="form-group">
                <input type="number" class="form-control  input-lg" id="experience" autocomplete="off" name="experience" placeholder="Kinh nghiệm (tính theo năm) Yêu cầu" value="<?php echo $row['experience']; ?>" required="">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control  input-lg" id="qualification" name="qualification" placeholder="Yêu cầu bằng cấp" value="<?php echo $row['qualification']; ?>" required="">
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-flat btn-success">Cập nhật</button>
                  </div>
                </div>
              </form>
            </div>
            
          </div>
            
               
                  
              
                </div>
                    <?php
                    }
                  }
                ?>  
              </form>
            </div>
            
            
          </div>
        </div>
      </div>
    </section>

    

  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer" style="margin-left: 0px;">
    <div class="text-center">
     
    </div>
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../js/adminlte.min.js"></script>
<script type="text/javascript">
   function validatePhone(event) {

        //event.keycode will return unicode for characters and numbers like a, b, c, 5 etc.
        //event.which will return key for mouse events and other events like ctrl alt etc. 
        var key = window.event ? event.keyCode : event.which;

        if(event.keyCode == 8 || event.keyCode == 46 || event.keyCode == 37 || event.keyCode == 39) {
          // 8 means Backspace
          //46 means Delete
          // 37 means left arrow
          // 39 means right arrow
          return true;
        } else if( key < 48 || key > 57 ) {
          // 48-57 is 0-9 numbers on your keyboard.
          return false;
        } else return true;
      }

       function validateName(event) {

        //event.keycode will return unicode for characters and numbers like a, b, c, 5 etc.
        //event.which will return key for mouse events and other events like ctrl alt etc. 
        var key = window.event ? event.keyCode : event.which;

        if(event.keyCode == 8 || event.keyCode == 127 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 32) {
        
          return true;
        } else if( key < 65 || key > 90 && key < 97 || key > 122) {
          // 65-90 97-122 is A-Z a-z alphabets on your keyboard.
          return false;
        } else return true;
      }

</script>
</body>
</html>
