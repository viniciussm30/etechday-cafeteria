<?php

include "../../controller/conexao.php";

echo "Deu certo a conexão com o banco de dados";

$sql = "SELECT * FROM alunos";

$query = mysqli_query($conn, $sql);

while($resultado = mysqli_fetch_assoc($query)){
    $result[] = array_map('utf8_encode', $resultado);
}

echo json_encode($result);