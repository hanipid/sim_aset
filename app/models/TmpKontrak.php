<?php 
namespace Vokuro\Models;

use Phalcon\Mvc\Model;
use DateTime;
use DateTimeZone;
use Phalcon\Mvc\Model\Behavior\Timestampable;
/**
 * Model Temporary Kontrak
 */
class TmpKontrak extends Model
{
	
	public $id_tmp_kontrak;
	public $users_id;
	public $no;
	public $tgl;
	public $nilai_kontrak;
	public $dana;
	public $created_at;

	public function initialize()
	{
		$this->belongsTo("users_id", __NAMESPACE__ . "\Users", "id", ["alias" => "Users"]);
    $this->hasMany(
      "id_tmp_kontrak",
      __NAMESPACE__ . "\TmpKibA",
      "tmp_kontrak_id",
      ["alias" => "TmpKibA"]
    );

		$this->addBehavior(
			new Timestampable(array(
				'beforeCreate' => array(
					'field'  => 'created_at',
					'format' => $this->now(),
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