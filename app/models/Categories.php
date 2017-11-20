<?php

namespace Vokuro\Models;

class Categories extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=10, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=false)
     */
    public $parent;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $type;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        // $this->setSchema("vcms");
        // $this->setSource("categories");
        $this->hasMany('id', 'Vokuro\Models\Posts', 'category', ['alias' => 'Posts']);
    }

    public function getChilds()
    {
        $result = false;

        if($this->id) {
            $childs = self::find("parent = $this->id");
            if(count($childs)) {
                $result = $childs;
            }
        }

        return $result;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'categories';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Categories[]|Categories|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Categories|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
