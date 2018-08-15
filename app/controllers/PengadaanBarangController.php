<?php 
namespace Vokuro\Controllers;

use Vokuro\Models\TmpKontrak;
use Vokuro\Models\VTmpKontrak;
use Vokuro\Models\AsetKategori;
use Vokuro\Models\Akun;
use Vokuro\Models\VKodeBarang;
use Vokuro\Models\TmpKibA;
use Vokuro\Models\VTmpKibA;
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
    $currentPage  = (int) $_GET['p'];
    $keywords     = (string) $_GET['keywords'];
    if (! $currentPage) {
        $currentPage = 1;
    }
    if (! $keywords) {
      $keywords = null;
    }

		$tmp_kontrak = VTmpKontrak::find([
			"no LIKE ?1 OR tgl LIKE ?1 OR nilai_kontrak LIKE ?1 OR dana LIKE ?1",
			"bind" => ["1" => '%'.$keywords.'%'],
			"order" => "id_tmp_kontrak desc"
		]);

    $paginator = new PaginatorModel(
      [
        'data'  => $tmp_kontrak,
        'limit' => LIST_LIMIT,
        'page'  => $currentPage,
      ]
    );
		$this->view->setVars([
			"paginator" => $paginator->getPaginate()
		]);
	}

	public function createAction()
	{
		if ($this->request->isPost()) {
			$nomor_kontrak 	= $this->request->getPost("nomor_kontrak");
			$tanggal				= $this->request->getPost("tanggal");
			$nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$sumber_dana		= $this->request->getPost("sumber_dana");

			$tmp_kontrak 								= new TmpKontrak();
			$tmp_kontrak->users_id 			= $this->auth->getIdentity()['id'];
			$tmp_kontrak->no 						= $nomor_kontrak;
			$tmp_kontrak->tgl 					= $tanggal;
			$tmp_kontrak->nilai_kontrak	= str_replace(".", "", $nilai_kontrak);
			$tmp_kontrak->dana 					= $sumber_dana;

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
		$list_data_aset = TmpKibA::find([
			"tmp_kontrak_id = ?1",
			"bind" => ["1" => $idTmpKontrak]
		]);
		$this->view->setVars([
			"tmp_kontrak" => $tmp_kontrak,
			"aset_kategori" => $aset_kategori,
			"tmp_kib_a" => $tmp_kib_a,
			"list_data_aset" => $list_data_aset
		]);

		if ($this->request->isPost()) {
			$nomor_kontrak 	= $this->request->getPost("nomor_kontrak");
			$tanggal				= $this->request->getPost("tanggal");
			$nilai_kontrak	= $this->request->getPost("nilai_kontrak");
			$sumber_dana		= $this->request->getPost("sumber_dana");

			$tmp_kontrak->users_id 			= $this->auth->getIdentity()['id'];
			$tmp_kontrak->no 						= $nomor_kontrak;
			$tmp_kontrak->tgl 					= $tanggal;
			$tmp_kontrak->nilai_kontrak	= str_replace(".", "", $nilai_kontrak);
			$tmp_kontrak->dana 					= $sumber_dana;

			if (!$tmp_kontrak->save()) {
				$this->flashSession->error("Terjadi kesalahan saat mengubah data kontrak");
			} else {
				$this->flashSession->success("Berhasil mengubah data kontrak");
			}

			$this->response->redirect("pengadaan_barang/edit/".$tmp_kontrak->id_tmp_kontrak);
 		}
	}

	public function deleteAction($id_tmp_kontrak)
	{
		if ($this->auth->getIdentity()['profile'] == "Administrators") {
			$tmp_kontrak = TmpKontrak::findFirstByIdTmpKontrak($id_tmp_kontrak);

			$tmp_kib_a = TmpKibA::findByTmpKontrakId($id_tmp_kontrak);

			foreach ($tmp_kib_a as $tka) {
				if (!$tka->delete()) {
					foreach ($tka->getMessages() as $m) {
						$this->flashSession->error("Terjadi kesalahan saat menghapus data kontrak (barang)");
					}
				}
			}

			if (!$tmp_kontrak->delete()) {
				foreach ($tmp_kontrak->getMessages() as $m) {
					$this->flashSession->error("Terjadi kesalahan saat menghapus data kontrak");
				}
			} else {
				$this->flashSession->success("Berhasil menghapus data kontrak");
			}
		}
		$this->response->redirect("pengadaan_barang");
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
        'limit' => LIST_LIMIT,
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
			$nilai_realisasi 		= $this->request->getPost("nilai_realisasi");
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
			$tmp_kib_a->nilai_perolehan = str_replace(".", "", $nilai_perolehan);
			$tmp_kib_a->nilai_realisasi = str_replace(".", "", $nilai_realisasi);
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

	public function listKibAAction($id_tmp_kontrak)
	{
		$tmp_kib_a = VTmpKibA::findByTmpKontrakId($id_tmp_kontrak);

    $currentPage  = (int) $_GET['p'];
    $keywords     = (string) $_GET['keywords'];
    if (! $currentPage) {
        $currentPage = 1;
    }
    if (! $keywords) {
      $keywords = null;
    }

    $paginator = new PaginatorModel(
      [
        'data'  => $tmp_kib_a,
        'limit' => LIST_LIMIT,
        'page'  => $currentPage,
      ]
    );

		$this->view->setVars([
			"paginator" => $paginator->getPaginate(),
			"id_tmp_kontrak" => $id_tmp_kontrak
		]);
	}

	public function editKibAAction($id_tmp_kib_a)
	{
		$tmp_kib_a = TmpKibA::findFirstByIdTmpKibA($id_tmp_kib_a);
		$this->view->kib_a = $tmp_kib_a;

		if ($this->request->isPost()) {
			$luas_tanah 				= $this->request->getPost("luas_tanah");
			$alamat 						= $this->request->getPost("alamat");
			$status_tanah				= $this->request->getPost("status_tanah");
			$tanggal_sertifikat	= $this->request->getPost("tanggal_sertifikat");
			$nomor_sertifikat		= $this->request->getPost("nomor_sertifikat");
			$penggunaan 				= $this->request->getPost("penggunaan");
			$nilai_perolehan 		= $this->request->getPost("nilai_perolehan");
			$nilai_realisasi 		= $this->request->getPost("nilai_realisasi");
			$keterangan 				= $this->request->getPost("keterangan");

			$tmp_kib_a->luas = $luas_tanah;
			$tmp_kib_a->letak = $alamat;
			$tmp_kib_a->sts_tanah = $status_tanah;
			$tmp_kib_a->tgl_sertifikat = $tanggal_sertifikat;
			$tmp_kib_a->no_sertifikat = $nomor_sertifikat;
			$tmp_kib_a->penggunaan = $penggunaan;
			$tmp_kib_a->nilai_perolehan = str_replace(".", "", $nilai_perolehan);
			$tmp_kib_a->nilai_realisasi = str_replace(".", "", $nilai_realisasi);
			$tmp_kib_a->ket = $keterangan;

			if (!$tmp_kib_a->save()) {
				foreach ($tmp_kib_a->getMessages() as $m) {
					$this->flashSession->error("Terjadi kesalahan saat mengupdate Kib A ".$m);
				}
			} else {
				$this->flashSession->success("Data tersimpan");
			}
			$this->response->redirect("pengadaan_barang/listKibA/".$tmp_kib_a->tmp_kontrak_id);
		}
	}

	public function deleteKibAAction($id_tmp_kib_a)
	{
		$tmp_kib_a = TmpKibA::findFirstByIdTmpKibA($id_tmp_kib_a);

		if (!$tmp_kib_a->delete()) {
			foreach ($tmp_kib_a->getMessages() as $m) {
				$this->flashSession->error("Terjadi kesalahan saat menghapus data Kib A.".$m);
			}
		} else {
			$this->flashSession->success("Berhasil menghapus data Kib A");
		}

		$this->response->redirect("pengadaan_barang/listKibA/".$tmp_kib_a->tmp_kontrak_id);
	}
}