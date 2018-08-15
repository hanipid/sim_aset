<?php
namespace Vokuro\Models;

use Phalcon\Mvc\Model;

/**
 * Model Menu Sidebar
 */
class MenuSidebar extends Model
{
  public $id;
  public $sort;
  public $name;
  public $url;
  public $parent;
  public $profiles;
  public $icon;

  public function initialize()
  {
    
  }

  public function getChilds()
  {
    $result = false;

    if($this->id) {
      $childs = self::find([
        "parent = $this->id",
        "order" => "sort"
      ]);
      if(count($childs)) {
        $result = $childs;
      }
    }

    return $result;
  }

  public function isParents()
  {
    $result = false;

    if($this->id) {
      $parents = self::find("parent = $this->id");
      if(count($parents)) {
        $result = true;
      }
    }

    return $result;
  }
}