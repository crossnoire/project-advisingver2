<?php
	include '../backend/connection.php';
	$pagelvl = "2";
	include '../globalincludes/loginauthen.php';
?>
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
		<?php include '../globalincludes/header.php';?>
		<!--Navbar end-->
		<div class="container-fluid">
			<ol class="breadcrumb">
			  <li><a href="../index.php">Home</a></li>
			  <li class="active">All Subjects</li>
			</ol>
			<div class="container-fluid">
				<input type="text" id="search-type" value="subjects" hidden>
				<input type="text" class="form-control" name="subjectsearchbar" placeholder="Enter subject name" id="searchbar">
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>  </th>
									<th>Subject Code</th>
									<th>Subject Name</th>
									<th>Edit Details</th>
								</tr>
							</thead>
							<tbody id="tbodyallsub" class="pagina-tbl srch-rslt">
								<?php
									$sql = "SELECT * FROM subject LIMIT 0,10";
									$result = $conn->query($sql);
									$num = 0;
									while($row = $result->fetch_assoc()){
										$num++;
										echo '
											<tr>
												<td>'.$num.'</td>
												<td>'.$row['subject_name'].'</td>
												<td>'.$row['subject_description'].'</td>
												<td><a href="../edit/subject.php?subid='.$row['subject_id'].'"><button class="btn btn-success">Edit</button></a></td>
											</tr>
										';
									}
								?>	
							</tbody>
						</table>
					</div>
				</div>
				<?php
					$sql = "SELECT COUNT(*) AS TOTAL FROM subject";
                    $result = $conn->query($sql);
					$row = $result->fetch_assoc();
					$total = $row['TOTAL'];
					$numpages = $total/10;
					$pagenum = 10;
					$pagenumper = 0;

					echo '<input type="number" id="totpages" value="'.$pagenum.'" hidden>
						<nav aria-label="Page Navigation">
                            <ul class="pagination">';
                    for($i=0;$i<$numpages;$i++){
						if($i==0)
							echo '<li class="active" id="page-'.$i.'"><a href="#" onclick="pagination('.$i.',1,0,'.$pagenum.')">'.($i+1).'</a></li>';
						else
							echo '<li class="" id="page-'.$i.'"><a href="#" onclick="pagination('.$i.',1,'.($pagenumper = $pagenumper+$pagenum).','.$pagenum.')">'.($i+1).'</a></li>';
                                    }
				?>		
			</div>
	<!--Scripts-->
	<!-- Latest compiled and minified JavaScript -->
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/create2.js"></script>
	<script type="text/javascript" src="../js/userdeffunc2.js"></script>
	<script type="text/javascript" src="../js/pagination.js"></script>
	<script type="text/javascript" src="../js/search.js"></script>
	</body>
</html>