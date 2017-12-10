<?php session_start();?>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Halaman Login</title>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/style.css" rel="stylesheet">
    
</head>
  <body>
  	<div class="col-md-4 col-md-offset-4 form-register">
    <h3 class="text-center title-login">Daftar Akun</h3>
  		<form action="action-register.php" class="inner-login" method="post">
  			<?php 

  			if (isset($_SESSION['error-log'])) {
  				$errors = $_SESSION['error-log']; 
  				foreach ($errors as $error) {?>
  					<p><?php echo $error; ?></p>
  					<?php
  				}
  				unset($_SESSION['error-log']);
  			}
  			?>
  			<div class="form-group">
  				<label for="">Nama</label>
  				<input type="text" class="form-control" name="title" placeholder="Nama Lengkap"/>
  			</div>
  			<div class="form-group">
  				<label for="">Username</label>
  				<input type="text" class="form-control" name="username" placeholder="Username"/>
  			</div>
  			<div class="form-group">
  				<label for="">Password</label>
  				<input type="password" class="form-control" name="password" placeholder="Password"/>
  			</div>
  			<div class="form-group">
  				<label for="">Re - Password</label>
  				<input type="password" class="form-control" name="repassword" placeholder="Re Password"/>
  			</div>
  			<button class="btn btn-block btn-danger" type="submit">Daftar</button>
  		</form>
  		</br>
  		<div class="text-center">
  			<p>Back To <a href="login.php">Login</a></p>
  		</div>
  	</div>
  <script src="css/js/jquery.min.js"></script>
  <script src="css/js/bootstrap.min.js"></script>
  </body>
</html>