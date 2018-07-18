<?php 
namespace Vokuro\Controllers;

use Vokuro\Models\Akun;
use Vokuro\Models\AsetKategori;

/**
 * Controller Aset Kategori
 */
class AsetKategoriController extends ControllerBase
{
	
	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

	public function indexAction()
	{
		$akun = Akun::findByLevel(2);
		$aset_kategori = AsetKategori::find();
		$this->view->setVars([
			"akun" => $akun,
			"asetKategori" => $aset_kategori
		]);

		if ($this->request->isPost()) {

			// membuat aset kategori baru
			if ($this->request->getPost("is_new")) {
				$akun_aset 	= $this->request->getPost("akun_aset");
				$label			= $this->request->getPost("label");
				$background	= $this->request->getPost("background");

				$aset_kategori = new AsetKategori();
				$aset_kategori->akun_id = $akun_aset;
				$aset_kategori->label 	= $label;
				$aset_kategori->bg 			= $background;

				if (!$aset_kategori->save()) {
					$this->flashSession->error("Ada kesalahan saat membuat aset kategori baru");
				} else {
					$this->flashSession->success("Berhasil menambah Aset Kategori");
				}
			}

			// update data aset kategori
			if ($this->request->getPost("is_edit")) {
				$id_aset_kategori	= $this->request->getPost("id_aset_kategori");
				$akun_aset 				= $this->request->getPost("akun_aset");
				$label						= $this->request->getPost("label");
				$background				= $this->request->getPost("background");

				$aset_kategori = AsetKategori::findFirstByIdAsetKategori($id_aset_kategori);
				$aset_kategori->akun_id = $akun_aset;
				$aset_kategori->label 	= $label;
				$aset_kategori->bg 			= $background;

				if (!$aset_kategori->save()) {
					$this->flashSession->error("Ada kesalahan saat mengubah data aset kategori baru");
				} else {
					$this->flashSession->success("Berhasil mengubah data Aset Kategori");
				}
			}
			
			$this->response->redirect("aset_kategori");
		}
	}

	public function editAction($id)
	{
		$this->view->disable();
		$aset_kategori = AsetKategori::findFirstByIdAsetKategori($id);
		$akun = Akun::findByLevel(2);
		echo '<div class="form-group">
            <label for="akun_aset" class="col-sm-3 control-label">Akun Aset</label>
            <div class="col-sm-9">
            	<select class="form-control" id="akun_aset" name="akun_aset">
            		';
		foreach ($akun as $a) {
			echo 			'<option value="'.$a->idak.'" ';
			if($a->idak==$aset_kategori->akun_id)echo "selected";
			echo'>'.$a->nama.'</option>';
		}
		echo '
            	</select>
            </div>
          </div>
          <div class="form-group">
            <label for="label" class="col-sm-3 control-label">Label</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="label" id="label" placeholder="Label" value="'.$aset_kategori->label.'">
            </div>
          </div>
          <div class="form-group">
            <label for="label" class="col-sm-3 control-label">Background</label>
            <div class="col-sm-2">
              <input type="color" class="form-control" name="background" id="background" placeholder="Background" value="'.$aset_kategori->bg.'">
              <input type="hidden" class="form-control" name="id_aset_kategori" id="id_aset_kategori" placeholder="id" value="'.$aset_kategori->id_aset_kategori.'">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-3 col-sm-offset-3">
              <a href="'.$this->url->getBaseUri().'aset_kategori/delete/'.$aset_kategori->id_aset_kategori.'" class="btn btn-danger" onclick="return confirm(\'Apakah Anda yakin ingin menghapus data ini?\')">Delete</a>
            </div>
          </div>';
	}

	public function deleteAction($id)
	{
		$aset_kategori = AsetKategori::findFirstByIdAsetKategori($id);
		if (!$aset_kategori->delete()) {
			$this->flashSession->error("Terjadi kesalahan saat menghapus data aset kategori");
		} else {
			$this->flashSession->success("Berhasil menghapus data");
		}
		$this->response->redirect("aset_kategori");
	}
}