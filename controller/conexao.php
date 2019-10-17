<?php

  include 'config.php' ;
	
	//1. fazer a conexão com o banco de dados
  $servename = "localhost";
	$username = "root";
  $password = "";
  $port     = 3307 ;
	$database = "etechday" ;

	//2. criar conexão no servidor
  $conn = mysqli_connect($servename, $username, $password, $database, $port );
  mysqli_set_charset($conn, "utf8") ;

	//2.1 testar conexão
	if (!$conn){
		die("falha na conexão: ".mysqli_connect_error());
	}

?>