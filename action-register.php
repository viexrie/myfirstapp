<?php 
require 'config.php';

if (isset($_POST['username'])) { // 
	$error = array();

	$nama = $_POST['title'];
	$username= $_POST['username'];
	$password= $_POST['password'];
	$repassword= $_POST['repassword'];

	if (empty($nama)) {
		$error[] = "<script>alert('Nama Tidak Boleh Kosong'); window.location.href='register.php';</script>";
	}
	if (empty($username)) {
		$error[] = "<script>alert('Username Tidak Boleh Kosong'); window.location.href='register.php';</script>";
	}
	if (empty($password)) {
		$error[] = "<script>alert('Password Tidak Boleh Kosong'); window.location.href='register.php';</script>";
	}

	if ($password != $repassword) {
		$error[] = "<script>alert('Password Tidak Boleh Kosong'); window.location.href='register.php';</script>";
	}

	if (count($error)==0) { // tidak ada error
		$password = md5($password);
		$sql = "INSERT INTO users (nama, username, password, level_user) VALUES ('$nama', '$username', '$password', 'member')";
		$insert = $dbconnect->query($sql);

		if ($insert) {
			echo "<script>alert('Registrasi Berhasil'); window.location.href='register.php';</script>";
			exit();
		} else {
			echo "Error!";
		}
	} else{
		session_start();
		$_SESSION['error-log'] = $error;
		header('location:register.php?error=register');
	}
} else {
	header('location:register.php');
}
?>
