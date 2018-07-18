<?php
namespace Vokuro\Models;

use Phalcon\Mvc\Model;

/**
 * Model Aset Kategori
 */
class AsetKategori extends Model
{
	public $id_aset_kategori;
	public $akun_id;
	public $label;
	public $bg;

	public function initialize()
	{
		$this->belongsTo(
			"akun_id",
			"Vokuro\Models\Akun",
			"idak",
			["alias" => "Akun"]
		);
	}
}