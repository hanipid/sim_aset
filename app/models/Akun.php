<?php

namespace Vokuro\Models;

use \Phalcon\Mvc\Model;

/**
 * Akun
 */
class Akun extends Model
{
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