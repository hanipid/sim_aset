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
      "Vokuro\Models\AsetKategori",
      "akun_id",
      ["alias" => "AsetKategori"]
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