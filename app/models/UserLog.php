<?php
namespace Vokuro\Models;

use Phalcon\Mvc\Model;
use DateTime;
use DateTimeZone;
use Phalcon\Mvc\Model\Behavior\Timestampable;

/**
 * Model User Log
 */
class UserLog extends Model
{
	public $id;
	public $user_id;
	public $data;
	public $tanggal;

	public function initialize()
	{
		$this->addBehavior(
			new Timestampable(array(
				'beforeCreate' => array(
					'field'  => 'tanggal',
					'format' => $this->now(),
				),
				'beforeUpdate' => array(
					'field'  => 'tanggal',
					'format' => $this->now()
				),
			))
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
}