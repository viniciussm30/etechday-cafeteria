<?php

  include "../../controller/conexao.php" ;

  $resposta = array( ) ;

  if( !isset( $_REQUEST["usuario"] ) || !isset( $_REQUEST["senha"] ) ){

    $resposta["status"] = -2 ;
    $resposta["msg"]    = "Parâmetros obrigatórios não informados" ;

    echo json_encode( $resposta ) ;
    exit ;

  }

  $sql = "
    select 
      ID,
      LOGIN, 
      PASSWORD 
    from usuario 
    where login    = '" . $_REQUEST["usuario"] . "' 
    and   password = '" . $_REQUEST["senha"] . "'"  ;

  $retornoBanco = mysqli_query( $conn, $sql ) ;

  if( !$retornoBanco ){
    $resposta["status"] = -1 ;
    $resposta["msg"]    = "ocorreu um erro na execução do WS. cod=1002" ;

  }

  $linhas = mysqli_fetch_assoc( $retornoBanco ) ;

  if( $linhas ){
    $resposta["status"] = 0 ;
    $resposta["code"]   = $linhas["ID"] ;
    $resposta["msg"]    = "login realizado com sucesso" ;
  }else{
    $resposta["status"] = 1 ;
    $resposta["msg"]    = "login e/ou senha inválidos" ;
  }

  echo json_encode( $resposta ) ;
  exit ;

?>
