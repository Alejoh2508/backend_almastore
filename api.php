<?php

error_reporting(E_ERROR | E_WARNING | E_PARSE);
ini_set('display_errors', 1);
error_reporting(-1);

require_once 'kiosco.php';
// echo 'SERVE<pre>';
// print_r($_SERVER);
// echo 'REQUEST<pre>';
// print_r($_REQUEST);
// $data = json_decode(file_get_contents('php://input'), true);
// echo 'JSON<pre>';
// print_r($data);

$objKiosco = new kiosco();
$vUri = explode("api.php/", $_SERVER['REQUEST_URI']);
$cMetodo = $_SERVER['REQUEST_METHOD'];
$mDatos = ["message" => "", "data" => []];
switch ($cMetodo) {
  case "POST":
    $mParams = json_decode(file_get_contents('php://input'), true);
    $mResult = $objKiosco->{$vUri[1]}($mParams);
    break;
  case "GET":
    $mResult = $objKiosco->{$vUri[1]}();
    break;
  default:
    echo "Metodo invalido.";
    break;
}
if (!empty($mResult)) {
  $mDatos["message"] = "Consulta Exitosa";
  $mDatos["data"] = $mResult;
} else {
  $mDatos["message"] = "Sin Resultados";
}
echo json_encode($mDatos);
