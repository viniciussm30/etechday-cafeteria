<?php
	
	//1. fazer a conexão com o banco de dados
	$servename = "localhost";
	$username = "root";
	$password = "";
	$database = "etechday" ;

	//2. criar conexão no servidor
	$conn = mysqli_connect($servename, $username, $password, $database );

	//2.1 testar conexão
	if (!$conn){
		die("falha na conexão: ".mysqli_connect_error());
	}

?>