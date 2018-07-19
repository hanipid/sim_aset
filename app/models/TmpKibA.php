<?php 
namespace Vokuro\Models;

use Phalcon\Mvc\Model;

/**
 * Model Temporary Kib A
 */
class TmpKibA extends Model
{
	public $id_tmp_kib_a;
	public $tmp_kontrak_id;
	public $akun_idak;
	public $luas;
	public $letak;
	public $sts_tanah;
	public $tgl_sertifikat;
	public $no_sertifikat;
	public $pengunaan;
	public $nilai_perolehan;
	public $ket;

	public function initialize()
	{
		$this->belongsTo("tmp_kontrak_id", __NAMESPACE__ . "\TmpKontrak", "id_tmp_kontrak", ["alias" => "TmpKontrak"]);
		$this->belongsTo("akun_idak", __NAMESPACE__ . "\Akun", "idak", ["alias" => "Akun"]);
	}
}