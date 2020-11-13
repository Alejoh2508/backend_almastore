<?php
header('Access-Control-Allow-Origin: *');
error_reporting(E_ERROR | E_WARNING | E_PARSE);
ini_set('display_errors', 1);
error_reporting(-1);

require_once 'kiosco.php';

$objKiosco = new kiosco();
$vUri = explode("api.php/", $_SERVER['REQUEST_URI']);
$cMetodo = $_SERVER['REQUEST_METHOD'];
$mDatos = ["resultado" => "", "data" => []];
switch ($cMetodo) {
  case "POST":
    header('Content-Type: application/json');
    $mParams = json_decode(file_get_contents('php://input'), true);
    $mResult = $objKiosco->{$vUri[1]}($mParams);
    break;
  case "GET":
    $mResult = $objKiosco->{$vUri[1]}();
    break;
  case "OPTIONS":
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
    header("Access-Control-Allow-Headers: Content-Type, origin");
    header('Access-Control-Max-Age: 86400');
    die(0);
    break;
  default:
    echo "Metodo invalido.";
    break;
}
if (!empty($mResult)) {
  $mDatos["resultado"] = "Consulta Exitosa";
  $mDatos["data"] = $mResult;
} else {
  $mDatos["resultado"] = "Sin Resultados";
}
echo json_encode($mDatos);
