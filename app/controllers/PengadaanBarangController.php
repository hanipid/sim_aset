<?php 
namespace Vokuro\Controllers;

use Vokuro\Models\TmpKontrak;
use Vokuro\Models\AsetKategori;
use Vokuro\Models\Akun;
use Vokuro\Models\VKodeBarang;
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

	public function editAction($id)
	{
		$tmp_kontrak 		= TmpKontrak::findFirstByIdTmpKontrak($id);
		$aset_kategori	= AsetKategori::find();
		$this->view->setVars([
			"tmp_kontrak" => $tmp_kontrak,
			"aset_kategori" => $aset_kategori
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

	public function level3Action($idak)
	{
		$this->view->cleanTemplateBefore();
		$akun = Akun::findByParent($idak);
		$this->view->akun = $akun;
	}

	public function listAkunAction($idak)
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
      'keywords' => $keywords
		]);
	}
}