<?php

  include "../../controller/conexao.php" ;

  $resposta = array( ) ;

  if( 
      !isset( $_REQUEST["pedido_id"]  )  ||
      !isset( $_REQUEST["produto_id"] )  ||
      !isset( $_REQUEST["qtde"] )        ||
      !isset( $_REQUEST["valor_unit"] )
  ){

    $resposta["status"] = -2 ;
    $resposta["msg"]    = "Parâmetros obrigatórios não informados" ;

    echo json_encode( $resposta ) ;
    exit ;

  }

  $pedidoItemVO["PRODUTO_ID"]  = $_REQUEST["produto_id"] ;
  $pedidoItemVO["QTDE"]        = $_REQUEST["qtde"] ;
  $pedidoItemVO["VALOR_UNIT"]  = $_REQUEST["valor_unit"] ;
  $pedidoItemVO["VALOR_TOTAL"] = $pedidoItemVO["VALOR_UNIT"] * $pedidoItemVO["QTDE"] ;

  $sql = "
    insert into
    pedido_item ( 
        PRODUTO_ID, 
        QTDE, 
        VALOR_UNIT, 
        VALOR_TOTAL )
    values ( 
        " . $pedidoItemVO["PRODUTO_ID"] . ", 
        " . $pedidoItemVO["QTDE"] . ", 
        " . $pedidoItemVO["VALOR_UNIT"] . ", 
        " . $pedidoItemVO["VALOR_TOTAL"] . "
    ) " ;

  $retornoBanco = mysqli_query( $conn, $sql ) ;

  if( !$retornoBanco ){

    $resposta["status"] = -1 ;
    $resposta["msg"]    = "ocorreu um erro na execução do WS. cod=1002" ;

  } else{

    #ATUALIZAR PEDIDO

    $sqlPedido = "
      select " ;

    $resposta["status"] = 0 ;
    $resposta["msg"]    = "success" ;
    $resposta["pedido_id"] = mysqli_insert_id( $conn ) ;

  }

  echo json_encode( $resposta ) ;
  exit ;

?>