<?php 
	error_reporting(0);
	require_once('conn.php');

	$consulta = mysqli_query($connect, "SELECT * FROM producto ORDER BY idproducto DESC LIMIT 1")
    or die ("Error al traer los datos");

    $idproducto=1000;

    while ($extraido = mysqli_fetch_array($consulta)) {
        $idproducto = $extraido['idproducto'] + 1;
    }

    date_default_timezone_set('America/La_Paz');
	$fecha= date('Y-m-d-H:i:s');
	$cedula= $_POST['cedula'];
	$imei= $_POST['imei'];
	$producto= $_POST['producto'];
	$descripcion= $_POST['descripcion'];

	$query = mysqli_query($connect, "INSERT INTO producto(idproducto, fecha, cedula, imei, producto, descripcion, status) 
				VALUES ('$idproducto','$fecha', '$cedula', '$imei', '$producto', '$descripcion' ,'en proceso')")

	or die ("Error al registrar producto");

	echo "<meta http-equiv=\"refresh\" content=\"0;URL= imprimirComprobante.php?idproducto=$idproducto\">"; 
	
 ?>