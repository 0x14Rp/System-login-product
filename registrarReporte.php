<?php 
	error_reporting(0);
	require_once('conn.php');

	$consulta = mysqli_query($connect, "SELECT * FROM producto ORDER BY idproducto DESC LIMIT 1")
    or die ("Error al traer los datos");

    date_default_timezone_set('America/La_Paz');
	$fecha= date('Y-m-d');
	$nombre= $_POST['nombre'];
	$producto= $_POST['producto'];
	$servicio= $_POST['servicio'];
	$resultado= $_POST['resultado'];

	$query = mysqli_query($connect, "INSERT INTO reporte(idproducto, fecha, nombre_producto, nombre_cliente, resultado) 
				VALUES ('$servicio', '$fecha', '$producto', '$nombre', '$resultado')")

	or die ("Error al registrar reporte");

	$query2= mysqli_query($connect, "UPDATE producto SET status='finalizado'  WHERE idproducto='$servicio'") or die ("Error al update producto");


	echo "<meta http-equiv=\"refresh\" content=\"0;URL= generarReporte.php\">"; 
	
 ?>