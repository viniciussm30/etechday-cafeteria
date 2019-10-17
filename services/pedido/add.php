<?php

  include "../../controller/conexao.php" ;

  $resposta = array( ) ;

  if( 
      !isset( $_REQUEST["usuario_code"] ) || 
      !isset( $_REQUEST["datahora"] )     
  ){

    $resposta["status"] = -2 ;
    $resposta["msg"]    = "Parâmetros obrigatórios não informados" ;

    echo json_encode( $resposta ) ;
    exit ;

  }

  $sql = "
    insert into
    pedido ( DATAHORA_CRIACAO, REALIZADO_POR )
    values ( '" . $_REQUEST["datahora"] . "', '" . $_REQUEST["usuario_code"] . "' ) " ;

  $retornoBanco = mysqli_query( $conn, $sql ) ;

  if( !$retornoBanco ){

    $resposta["status"] = -1 ;
    $resposta["msg"]    = "ocorreu um erro na execução do WS. cod=1002" ;

  } else{

    $resposta["status"] = 0 ;
    $resposta["msg"]    = "success" ;
    $resposta["pedido_id"] = mysqli_insert_id( $conn ) ;

  }

  echo json_encode( $resposta ) ;
  exit ;

?>
