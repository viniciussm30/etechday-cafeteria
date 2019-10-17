<?php

  include "../../controller/conexao.php" ;

  $resposta = array( ) ;

  $sql = "select * from pedido " ;

  $retornoBanco = mysqli_query( $conn, $sql ) ;

  if( !$retornoBanco ){

    $resposta["status"] = -1 ;
    $resposta["msg"]    = "ocorreu um erro na execução do WS. cod=1002" ;

  } else {

    $resposta["status"] = 0 ;
    $resposta["msg"]    = "success" ;
    $resposta["data"]   = mysqli_fetch_all( $retornoBanco ) ;

  }

  echo json_encode( $resposta ) ;
  exit ;

?>