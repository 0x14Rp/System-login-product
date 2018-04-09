<?php 
	error_reporting(0);
	require_once('conn.php');

	$cedula= $_POST['cedula'];
	$nombre= $_POST['nombre'];
	$telefono= $_POST['telefono'];
	$correo= $_POST['correo'];

	$query = mysqli_query($connect, "INSERT INTO cliente(cedula, nombre, telefono, correo) 
				VALUES ('$cedula', '$nombre', '$telefono', '$correo')")

	or die ("Error al registrar cliente");

	echo "<meta http-equiv=\"refresh\" content=\"0;URL= nuevoServicio.php?cliente=existente&cedula=$cedula\">"; 
	
 ?>