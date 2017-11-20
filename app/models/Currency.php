<?php

namespace Vokuro\Models;

class Currency extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=58, nullable=true)
     */
    public $entity;

    /**
     *
     * @var string
     * @Column(type="string", length=65, nullable=true)
     */
    public $currency;

    /**
     *
     * @var string
     * @Column(type="string", length=3, nullable=true)
     */
    public $alphabetic_code;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $numeric_code;

    /**
     *
     * @var string
     * @Column(type="string", length=4, nullable=true)
     */
    public $minor_unit;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        // $this->setSchema("vcms");
        // $this->setSource("currency");
        $this->hasMany('id', __NAMESPACE__ . '\BasicSettings', 'currency', ['alias' => 'BasicSettings']);
        $this->hasMany('id', __NAMESPACE__ . '\Posts', 'currency', ['alias' => 'Posts']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'currency';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Currency[]|Currency|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Currency|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
