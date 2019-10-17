<?php

  include "../../controller/conexao.php" ;

  $resposta = array( ) ;

  $sql = "
    select 
      produto.*,
      produto_categoria.ID PRODUTO_CATEGORIA_ID,
      produto_categoria.DESCRICAO PRODUTO_CATEGORIA_DESCRICAO      
    from produto 
    join produto_categoria on ( produto.CATEGORIA_ID = produto_categoria.ID ) " ;

  if( isset( $_REQUEST["categoria_id"] ) ){
    $sql .= " where produto.CATEGORIA_ID = " . $_REQUEST["categoria_id"] ;
  }

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
