<?php

include_once 'database.php';

class kiosco extends database {
  public function getGeneros() {
    $mResult = [];
    $sGener = "SELECT * ";
    $sGener .= "FROM generos ";
    $sGener .= "WHERE estado = \"ACTIVO\" ";
    $objResult = $this->connect()->query($sGener);
    if ($objResult->rowCount()) {
      while ($vAssRes = $objResult->fetch(PDO::FETCH_ASSOC)) {
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }

  public function getCategoriasGenero() {
    $mResult = [];
    $sCatGen = "SELECT gc.id_genero_categoria, ";
    $sCatGen .= "c.nombre_categoria, ";
    $sCatGen .= "g.descripcion ";
    $sCatGen .= "FROM generos_categorias as gc ";
    $sCatGen .= "JOIN categorias AS c ON c.id_categoria = gc.fk_id_categoria AND c.estado = \"ACTIVO\" ";
    $sCatGen .= "JOIN generos AS g ON g.id_genero = gc.fk_id_genero AND g.estado = \"ACTIVO\" ";
    $sCatGen .= "WHERE gc.estado = \"ACTIVO\" ";
    $objResult = $this->connect()->query($sCatGen);
    if ($objResult->rowCount()) {
      while ($vAssRes = $objResult->fetch(PDO::FETCH_ASSOC)) {
        if (!array_key_exists($vAssRes["descripcion"], $mResult)) {
          $mResult[$vAssRes["descripcion"]] = [];
        }
        $vCatego = ["id" => $vAssRes["id_genero_categoria"], "nombre" => $vAssRes["nombre_categoria"]];
        array_push($mResult[$vAssRes["descripcion"]], $vCatego);
      }
    }
    return $mResult;
  }

  public function getProductos($mParam) {
    $mResult = [];
    $nLimit = isset($mParam["limit"]) ? $mParam["limit"] : 9;
    $nPage = isset($mParam["page"]) ? $mParam["page"] : 0;
    $sProduc = "SELECT p.* ";
    $sProduc .= "FROM productos as p ";
    //    if (isset($mParam["id_categoria"]) && !empty($mParam["id_categoria"]) && $mParam["id_categoria"] != 0) {
    //      $sProduc .= "JOIN generos_categorias AS gc ON gc.id_genero_categoria = p.fk_id_genero_categoria AND gc.estado = \"ACTIVO\" ";
    //    }
    if (isset($mParam["id_genero"]) && !empty($mParam["id_genero"]) && $mParam["id_genero"] != 0) {
      $sProduc .= "JOIN generos_categorias AS gc ON gc.id_genero_categoria = p.fk_id_genero_categoria AND gc.estado = \"ACTIVO\" ";
      $sProduc .= "JOIN generos AS g ON g.id_genero = gc.fk_id_genero AND g.estado = \"ACTIVO\" ";
    }
    $sProduc .= "WHERE p.estado = \"ACTIVO\" ";
    if (isset($mParam["id_categoria"]) && !empty($mParam["id_categoria"]) && $mParam["id_categoria"] != 0) {
      $sProduc .= "AND p.fk_id_genero_categoria = \"{$mParam["id_categoria"]}\" ";
    }
    if (isset($mParam["id_genero"]) && !empty($mParam["id_genero"]) && $mParam["id_genero"] != 0) {
      $sProduc .= "AND g.id_genero = \"{$mParam["id_genero"]}\" ";
    }
    $sProduc .= "LIMIT {$nPage}, {$nLimit}";
  }

}