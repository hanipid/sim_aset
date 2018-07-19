<?php 
namespace Vokuro\Controllers;

use Vokuro\Models\TmpKontrak;
use Vokuro\Models\AsetKategori;
use Vokuro\Models\Akun;
use Vokuro\Models\VKodeBarang;
use Vokuro\Models\TmpKibA;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
/**
 * Controller Pengadaan Barang
 */
class PengadaanBarangController extends ControllerBase
{
	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

	public function indexAction()
	{
		if ($this->request->isPost()) {
			$nomor_kontrak 	= $this->request->getPost("nomor_kontrak");
			$tanggal				= $this->request->getPost("tanggal");
			$nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$sumber_dana		= $this->request->getPost("sumber_dana");

			$tmp_kontrak 								= new TmpKontrak();
			$tmp_kontrak->users_id 			= $this->auth->getIdentity()['id'];
			$tmp_kontrak->no 						= $this->request->getPost("nomor_kontrak");
			$tmp_kontrak->tgl 					= $this->request->getPost("tanggal");
			$tmp_kontrak->nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$tmp_kontrak->dana 					= $this->request->getPost("sumber_dana");

			if (!$tmp_kontrak->save()) {
				$this->flashSession->error("Terjadi kesalahan saat membuat kontrak baru");
			} else {
				$this->flashSession->success("Berhasil membuat kontrak");
			}

			$tmp_kontrak = TmpKontrak::findFirst([
				"order" => "id_tmp_kontrak desc"
			]);

			$this->response->redirect("pengadaan_barang/edit/".$tmp_kontrak->id_tmp_kontrak);
 		}
	}

	public function editAction($idTmpKontrak)
	{
		$tmp_kontrak 		= TmpKontrak::findFirstByIdTmpKontrak($idTmpKontrak);
		$aset_kategori	= AsetKategori::find();
		$tmp_kib_a 			= TmpKibA::find();
		$this->view->setVars([
			"tmp_kontrak" => $tmp_kontrak,
			"aset_kategori" => $aset_kategori,
			"tmp_kib_a" => $tmp_kib_a
		]);

		if ($this->request->isPost()) {
			$nomor_kontrak 	= $this->request->getPost("nomor_kontrak");
			$tanggal				= $this->request->getPost("tanggal");
			$nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$sumber_dana		= $this->request->getPost("sumber_dana");

			$tmp_kontrak->users_id 			= $this->auth->getIdentity()['id'];
			$tmp_kontrak->no 						= $this->request->getPost("nomor_kontrak");
			$tmp_kontrak->tgl 					= $this->request->getPost("tanggal");
			$tmp_kontrak->nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$tmp_kontrak->dana 					= $this->request->getPost("sumber_dana");

			if (!$tmp_kontrak->save()) {
				$this->flashSession->error("Terjadi kesalahan saat mengubah data kontrak");
			} else {
				$this->flashSession->success("Berhasil mengubah data kontrak");
			}

			$this->response->redirect("pengadaan_barang/edit/".$tmp_kontrak->id_tmp_kontrak);
 		}
	}

	public function level3Action($id_tmp_kontrak,$idak)
	{
		$this->view->cleanTemplateBefore();
		$akun = Akun::findByParent($idak);
		$this->view->akun = $akun;
		$this->view->id_tmp_kontrak = $id_tmp_kontrak;
	}

	public function listAkunAction($id_tmp_kontrak,$idak)
	{
    $currentPage  = (int) $_GET['p'];
    $keywords     = (string) $_GET['keywords'];
    if (! $currentPage) {
        $currentPage = 1;
    }
    if (! $keywords) {
      $keywords = null;
    }

		$akun = Akun::findFirstByIdak($idak);
		$parent = Akun::findFirstByIdak($akun->parent);
		$VKodeBarang = VKodeBarang::find([
			"kode_level2 = ?1 AND kode_level3 = ?2 AND level > 3 AND nama LIKE ?3",
			"bind" => [
				"1" => $parent->kdak,
				"2" => $akun->kdak,
				"3" => '%'.$keywords.'%'
			]
		]);

    $paginator = new PaginatorModel(
      [
        'data'  => $VKodeBarang,
        'limit' => 10,
        'page'  => $currentPage,
      ]
    );
		$this->view->setVars([
			"VKodeBarang" => $VKodeBarang,
			"akun" => $akun,
			"parent" => $parent,
      'paginator' => $paginator->getPaginate(),
      'keywords' => $keywords,
      'id_tmp_kontrak' => $id_tmp_kontrak
		]);
	}


	public function createKibAAction()
	{
		$id_tmp_kontrak = $this->request->getPost("id_tmp_kontrak");
		$idak 					= $this->request->getPost("idak");
		$jumlah 				= $this->request->getPost("jumlah");

		if ($this->request->getPost("is_new")) {
			$luas_tanah 				= $this->request->getPost("luas_tanah");
			$alamat 						= $this->request->getPost("alamat");
			$status_tanah				= $this->request->getPost("status_tanah");
			$tanggal_sertifikat	= $this->request->getPost("tanggal_sertifikat");
			$nomor_sertifikat		= $this->request->getPost("nomor_sertifikat");
			$penggunaan 				= $this->request->getPost("penggunaan");
			$nilai_perolehan 		= $this->request->getPost("nilai_perolehan");
			$keterangan 				= $this->request->getPost("keterangan");

			$tmp_kib_a = new TmpKibA();
			$tmp_kib_a->tmp_kontrak_id = $id_tmp_kontrak;
			$tmp_kib_a->akun_idak = $idak;
			$tmp_kib_a->luas = $luas_tanah;
			$tmp_kib_a->letak = $alamat;
			$tmp_kib_a->sts_tanah = $status_tanah;
			$tmp_kib_a->tgl_sertifikat = $tanggal_sertifikat;
			$tmp_kib_a->no_sertifikat = $nomor_sertifikat;
			$tmp_kib_a->penggunaan = $penggunaan;
			$tmp_kib_a->nilai_perolehan = $nilai_perolehan;
			$tmp_kib_a->ket = $keterangan;

			if (!$tmp_kib_a->save()) {
				foreach ($tmp_kib_a->getMessages() as $m) {
					$this->flashSession->error("Terjadi kesalahan saat menyimpan Kib A ".$m);
				}
			} else {
				$this->flashSession->success("Data tersimpan");
			}


			// kalo $jumlah > 0, buat Kib A lagi
			$jumlah -= 1;
			if ($jumlah == 0) {
				$this->response->redirect("pengadaan_barang/edit/".$id_tmp_kontrak);
			}
		}

		$this->view->setVars([
			"id_tmp_kontrak" 	=> $id_tmp_kontrak,
			"idak" 						=> $idak,
			"jumlah" 					=> $jumlah
		]);
	}
}