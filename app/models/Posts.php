<?php

namespace Vokuro\Models;

use DateTime;
use DateTimeZone;
use Phalcon\Mvc\Model\Behavior\Timestampable;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

class Posts extends \Phalcon\Mvc\Model
{

	/**
	 *
	 * @var integer
	 * @Primary
	 * @Identity
	 * @Column(type="integer", length=20, nullable=false)
	 */
	public $id;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=255, nullable=false)
	 */
	public $title;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=10, nullable=false)
	 */
	public $author;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=10, nullable=false)
	 */
	public $category;

	/**
	 *
	 * @var string
	 * @Column(type="string", nullable=false)
	 */
	public $content;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=11, nullable=true)
	 */
	public $currency;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=20, nullable=true)
	 */
	public $price;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=20, nullable=true)
	 */
	public $price2;

	/**
	 *
	 * @var integer
	 * @Column(type="integer", length=11, nullable=true)
	 */
	public $discount;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=255, nullable=false)
	 */
	public $url;

	/**
	 *
	 * @var string
	 * @Column(type="string", nullable=true)
	 */
	public $images;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=5, nullable=false)
	 */
	public $comment_status;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=20, nullable=false)
	 */
	public $status;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=20, nullable=false)
	 */
	public $post_type;

	/**
	 *
	 * @var string
	 * @Column(type="string", length=1, nullable=true)
	 */
	public $column_set;

	/**
	 *
	 * @var string
	 * @Column(type="string", nullable=true)
	 */
	public $created_at;

	/**
	 *
	 * @var string
	 * @Column(type="string", nullable=true)
	 */
	public $updated_at;

  /**
   *
   * @var string
   */
  public $deleted_at;

	/**
	 * Initialize method for model.
	 */
	public function initialize()
	{
		// $this->setSchema("vcms");
		// $this->setSource("posts");
		$this->belongsTo('category', __NAMESPACE__ . '\Categories', 'id', ['alias' => 'Categories']);
		$this->belongsTo('currency', __NAMESPACE__ . '\Currency', 'id', ['alias' => 'Currency']);
		$this->belongsTo('author', __NAMESPACE__ . '\Users', 'id', ['alias' => 'Users']);

		
		$this->addBehavior(
			new Timestampable(array(
				'beforeCreate' => array(
					'field'  => 'created_at',
					'format' => $this->now(),
				),
				'beforeUpdate' => array(
					'field'  => 'updated_at',
					'format' => $this->now()
				),
			))
		);

		$this->addBehavior(
			new SoftDelete(
				[
					"field" => "deleted_at",
					"value" => $this->now(),
				]
			)
		);
	}



  public function now()
  {
      $datetime = new Datetime(
          "now",
          new DateTimeZone(
              $this->getDI()->getConfig()->application->timezone
          )
      );
      return $datetime->format(
          $this->getDi()->getConfig()->application->datetime
      );
  }

	/**
	 * Returns table name mapped in the model.
	 *
	 * @return string
	 */
	public function getSource()
	{
		return 'posts';
	}

	/**
	 * Allows to query a set of records that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Posts[]|Posts|\Phalcon\Mvc\Model\ResultSetInterface
	 */
	public static function find($parameters = null)
	{
		return parent::find($parameters);
	}

	/**
	 * Allows to query the first record that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Posts|\Phalcon\Mvc\Model\ResultInterface
	 */
	public static function findFirst($parameters = null)
	{
		return parent::findFirst($parameters);
	}

}
