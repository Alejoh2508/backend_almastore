<?php

class database {
  private $host;
  private $db;
  private $user;
  private $password;
  private $charset;

  public function __construct() {
    $this->host = '192.168.10.20';
    $this->db = 'KIOSCO';
    $this->user = 'desarrollo';
    $this->password = "ywLmYSY48Vcm4Bbj";
    $this->charset = 'utf8';
  }

  function connect() {
    try {
      $connection = "mysql:host=" . $this->host . ";dbname=" . $this->db . ";charset=" . $this->charset;
      $options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_EMULATE_PREPARES => false,];
      $pdo = new PDO($connection, $this->user, $this->password);
      return $pdo;
    } catch (PDOException $e) {
      print_r("Erro Connection" . $e->getMessage());
    }
  }
}
