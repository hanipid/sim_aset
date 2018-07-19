<?php

namespace Vokuro\Models;

use \Phalcon\Mvc\Model;

/**
 * Akun
 */
class Akun extends Model
{
  public $idak;
  public $kdak;
  public $nama;
  public $level;
  public $parent;
  public $order;
  public $status;

  public function initialize()
  {
    $this->hasMany(
      "idak",
      __NAMESPACE__ . "\AsetKategori",
      "akun_id",
      ["alias" => "AsetKategori"]
    );
    $this->hasMany(
      "idak",
      __NAMESPACE__ . "\TmpKibA",
      "akun_idak",
      ["alias" => "TmpKibA"]
    );
  }
  
  public function getChilds()
  {
    $result = false;

    if($this->idak) {
      $childs = self::find("parent = $this->idak");
      if(count($childs)) {
        $result = $childs;
      }
    }

    return $result;
  }
}