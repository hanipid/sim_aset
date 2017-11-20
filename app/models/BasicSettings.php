<?php

namespace Vokuro\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class BasicSettings extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=1, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $site_name;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $meta_title;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $meta_description;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $address;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $phone_number;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $logo;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $currency;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ss_speed;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        // $this->setSchema("vcms");
        // $this->setSource("basic_settings");
        $this->belongsTo('currency', __NAMESPACE__ . '\Currency', 'id', ['alias' => 'Currency']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'basic_settings';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return BasicSettings[]|BasicSettings|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return BasicSettings|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
