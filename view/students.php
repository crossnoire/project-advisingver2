<!DOCTYPE html>
<html>
	<head>
		<title>Student Advising System Ver: 2.0</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<!-- Optional theme -->
		<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
		
	</head>
	<body>
		<!--Navbar-->
		<nav class="navbar navbar-inverse">
  			<div class="container-fluid">
    			<!-- Brand and toggle get grouped for better mobile display -->
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        				<span class="sr-only">Toggle navigation</span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
      				</button>
      				<a class="navbar-brand" href="../index.php">Student Advising System</a>
    			</div>
    			<!-- Collect the nav links, forms, and other content for toggling -->
    			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    				<ul class="nav navbar-nav">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View <span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="students.php">All Students</a></li>
				            <li><a href="curriculums.php">All Curriculums</a></li>
				            <li><a href="subjects.php">All Subjects</a></li>
				          </ul>
				        </li>
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Add <span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="#">New Student</a></li>
				            <li><a href="#">New Curriculum</a></li>
				            <li><a href="#">New Subjects</a></li>
				          </ul>
				        </li>
				        <li><a href="../import/import.php">Import</a></li>
				        <li><a href="../reports/reports.php">Reports</a></li>
				      </ul>
      				<ul class="nav navbar-nav navbar-right">
        				<li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome, Name of Adviser <span class="caret"></span></a>
          					<ul class="dropdown-menu">
            					<li><a href="#">Action</a></li>
            					<li><a href="#">Another action</a></li>
            					<li><a href="#">Something else here</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="../phpbackend/logout.php">Logout</a></li>
          					</ul>
        				</li>
      				</ul>
    			</div><!-- /.navbar-collapse -->
  			</div><!-- /.container-fluid -->
		</nav>
		<!--Navbar end-->

		<div class="container-fluid">
			<ol class="breadcrumb">
			  <li><a href="../index.php">Home</a></li>
			  <li class="active">All Students</li>
			</ol>			
		</div>
	<!--Scripts-->
	<!-- Latest compiled and minified JavaScript -->
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	</body>
</html>