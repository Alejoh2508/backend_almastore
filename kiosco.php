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
    $nLimit = isset($mParam["filters"]["limit"]) ? $mParam["filters"]["limit"] : 9;
    $nPage = isset($mParam["filters"]["page"]) ? $mParam["filters"]["page"] : 0;
    $sProduc = "SELECT p.id_producto, ";
    $sProduc .= "p.nombre_producto, ";
    $sProduc .= "p.unidades_disponibles, ";
    $sProduc .= "p.precio_unitario, ";
    if (
      (isset($mParam["filters"]["categoria"]) && !empty($mParam["filters"]["categoria"])) ||
      (isset($mParam["filters"]["genero"]) && !empty($mParam["filters"]["genero"]))
    ) {
      $sProduc .= "c.id_categoria, ";
      $sProduc .= "c.nombre_categoria, ";
      $sProduc .= "g.id_genero, ";
      $sProduc .= "g.descripcion, ";
    }
    $sProduc .= "dt.id_detalle_producto, ";
    $sProduc .= "dt.imagen, ";
    $sProduc .= "dt.tallas ";
    $sProduc .= "FROM detalle_producto AS dt ";
    $sProduc .= "JOIN productos AS p ON p.id_producto = dt.fk_id_producto AND p.estado = \"ACTIVO\" ";
    if (
      (isset($mParam["filters"]["categoria"]) && !empty($mParam["filters"]["categoria"])) ||
      (isset($mParam["filters"]["genero"]) && !empty($mParam["filters"]["genero"]))
    ) {
      $sProduc .= "JOIN generos_categorias AS gc ON gc.id_genero_categoria = p.fk_id_genero_categoria AND gc.estado = \"ACTIVO\" ";
      $sProduc .= "JOIN categorias AS c ON c.id_categoria = gc.fk_id_categoria AND c.estado = \"ACTIVO\" ";
      $sProduc .= "JOIN generos AS g ON g.id_genero = gc.fk_id_genero AND g.estado = \"ACTIVO\" ";
    }
    $sProduc .= "WHERE dt.estado = \"ACTIVO\" ";
    if (isset($mParam["filters"]["categoria"]) && !empty($mParam["filters"]["categoria"])) {
      $sProduc .= "AND c.nombre_categoria = \"{$mParam["filters"]["categoria"]}\" ";
    }
    if (isset($mParam["filters"]["genero"]) && !empty($mParam["filters"]["genero"])) {
      $sProduc .= "AND g.descripcion = \"{$mParam["filters"]["genero"]}\" ";
    }
    $sProduc .= "GROUP BY p.id_producto ";
    $sProduc .= "ORDER BY p.id_producto DESC ";
    $sProduc .= "LIMIT {$nPage}, {$nLimit}";
    $objResult = $this->connect()->query($sProduc);
    if ($objResult->rowCount()) {
      while ($vAssRes = $objResult->fetch(PDO::FETCH_ASSOC)) {
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }

  public function getDetalleProducto($mParam) {
    $mResult = [];
    $sDetProd = "";
    $sDetProd = "SELECT p.id_producto, ";
    $sDetProd .= "p.nombre_producto, ";
    $sDetProd .= "p.unidades_disponibles, ";
    $sDetProd .= "p.precio_unitario, ";
    $sDetProd .= "dt.id_detalle_producto, ";
    $sDetProd .= "dt.imagen, ";
    $sDetProd .= "dt.tallas ";
    $sDetProd .= "FROM detalle_producto AS dt ";
    $sDetProd .= "JOIN productos AS p ON p.id_producto = dt.fk_id_producto AND p.estado = \"ACTIVO\" ";
    $sDetProd .= "WHERE dt.estado = \"ACTIVO\" ";
    $sDetProd .= "AND dt.fk_id_producto = \"{$mParam["filters"]["id_producto"]}\" ";
    $objResult = $this->connect()->query($sDetProd);
    if ($objResult->rowCount()) {
      while ($vAssRes = $objResult->fetch(PDO::FETCH_ASSOC)) {
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }

  public function f_CrearCliente($mParam) {
    $mResult = [];
    $sCliente = "SELECT c.id_cliente, ";
    $sCliente .= "c.cedula ";
    $sCliente .= "FROM clientes AS c ";
    $sCliente .= "WHERE c.cedula = \"{$mParam["cliente"]["cedula"]}\" ";
    $objResult = $this->connect()->query($sCliente);
    if ($objResult->rowCount()) {
      array_push($mResult, array("mensaje" => "El usuario a registrar ya existe en nuestro sistema"));
    } else {
      $sCedula = $mParam["cliente"]["cedula"];
      $sNombres = strtoupper($mParam["cliente"]["nombres"]);
      $sApellidos = strtoupper($mParam["cliente"]["apellidos"]);
      $sFecNac = $mParam["cliente"]["fecha_nacimiento"];
      $sCorreo = strtolower($mParam["cliente"]["correo"]);
      $sTelefono = $mParam["cliente"]["telefono"];
      $sContras = sha1($mParam["cliente"]["contrasenia"]);

      $sInsCli = "INSERT INTO clientes (cedula, nombres, apellidos, fecha_nacimiento, correo, telefono, contrasenia, estado, fecha_creacion, hora_creacion) ";
      $sInsCli .= "VALUES (\"{$sCedula}\", \"{$sNombres}\", \"{$sApellidos}\", \"{$sFecNac}\", \"{$sCorreo}\", {$sTelefono}, \"{$sContras}\", \"ACTIVO\", CURDATE(), CURTIME())";
      $objResult = $this->connect()->query($sInsCli);
      if ($objResult->rowCount()) {
        array_push($mResult, array("mensaje" => "El usuario se registró con exito"));
      }
    }
    return $mResult;
  }
  
  public function f_Login($mParam) {
    $mResult = [];
    $sUsuario = $mParam["usuario"];
    $sContras = sha1($mParam["contrasenia"]);

    $sCliente = "SELECT c.id_cliente, ";
    $sCliente .= "c.cedula, ";
    $sCliente .= "c.correo, ";
    $sCliente .= "c.contrasenia ";
    $sCliente .= "FROM clientes AS c ";
    $sCliente .= "WHERE c.cedula = \"{$sUsuario}\" ";
    $sCliente .= "OR c.correo = \"{$sUsuario}\" ";
    $objResult = $this->connect()->query($sCliente);
    if (!$objResult->rowCount()) {
      array_push($mResult, array("mensaje" => "El usuario no existe, por favor verifique"));
    } else {
      $vAssRes = $objResult->fetch(PDO::FETCH_ASSOC);
      if ($vAssRes["contrasenia"] != $sContras) {
        array_push($mResult, array("mensaje" => "Contraseña errada, por favor verifique"));
      } else {
        unset($vAssRes["contrasenia"]);
        $vAssRes["id_cliente"] = md5($vAssRes["id_cliente"]);
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }
}
