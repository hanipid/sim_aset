<?php
namespace Vokuro\Controllers;

use Vokuro\Models\Akun;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

/**
 * Number of items to show on the search list.
 */

/**
* Master Kode Barang
*/
class KodeBarangController extends ControllerBase
{
  
  public function initialize()
  {
    $this->view->setTemplateBefore("private");
    define('LIST_LIMIT', 10);
  }

  public function kelompokAction()
  {
    $this->view->akun = Akun::find("level = '2'");
  }

  public function jenisAction($level,$idak,$tmpKode)
  {
    $currentPage = (int) $_GET['p'];
    if (! $currentPage) {
        $currentPage = 1;
    }

    $akun = Akun::find([
      "parent = ?1 AND level = ?2",
      "bind" => [
        "1" => $idak,
        "2" => $level
      ],
      "order" => "kdak ASC"
    ]);

    $parent = Akun::findFirstByIdak($idak);

    // Passing an array as data
    $paginator = new PaginatorModel(
      [
        'data'  => $akun,
        'limit' => LIST_LIMIT,
        'page'  => $currentPage,
      ]
    );

    if ($level == 3) {
      $tmpKode = "1.".$parent->kdak;
    }

    $this->view->setVars(
      [
        'offset'        => ($currentPage - 1 ) * LIST_LIMIT,
        'paginator'     => $paginator->getPaginate(),
        'idak'          => $idak,
        'parent'        => $parent,
        'level'         => $level,
        'tmpKode'       => $tmpKode
      ]
    );

    if ($this->request->isPost()) {
      $kode = $this->request->getPost("kode");
      $nama = $this->request->getPost("nama");

      if ($level == 4 OR $level == 5 OR $level == 6) {
        $kode = sprintf('%02d', $kode);
      } elseif ($level == 7) {
        $kode = sprintf('%03d', $kode);
      }

      $akun = new Akun();
      $akun->kdak   = $kode;
      $akun->nama   = $nama;
      $akun->level  = $level;
      $akun->parent = $idak;
      $akun->status = 1;

      if (!$akun->save()) {
        $this->flash->error($akun->getMessages());
      } else {

        $this->flashSession->success("Kode barang ".$nama." berhasil ditambahkan");

        $this->response->redirect("kode_barang/jenis/".$level.'/'.$idak.'/'.$tmpKode);
      }
    }
  }

  public function editJenisAction($tmpKode,$idak)
  {
    $this->view->disable();

    $akun   = Akun::findFirstByIdak($idak);
    $kode_2 = Akun::findFirstByIdak($akun->parent);
    echo '<div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <input type="hidden" class="form-control" name="idak" id="kode" placeholder="Kode" value="'.$akun->idak.'">
              <div class="input-group">
                <span class="input-group-addon">'.$tmpKode.' </span>
                <input type="text" class="form-control" name="kode" id="kode" placeholder="Kode" value="'.$akun->kdak.'">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="nama" class="col-sm-3 control-label">Nama Jenis</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama Jenis" value="'.$akun->nama.'">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
              <a href="'.$this->url->getBaseUri().'kode_barang/deleteJenis/'.$akun->level.'/'.$akun->idak.'/'.$tmpKode.'" class="btn btn-danger btn-sm" onclick="return confirm(\'Apakah Anda yakin?\')">Delete</a>
            </div>
          </div>';

    if ($this->request->isPost()) {
      $idak = $this->request->getPost("idak");
      $kode = $this->request->getPost("kode");
      $nama = $this->request->getPost("nama");

      $akun = Akun::findFirstByIdak($idak);
      if ($akun->level == 4 OR $akun->level == 5 OR $akun->level == 6) {
        $kode = sprintf('%02d', $kode);
      } elseif ($akun->level == 7) {
        $kode = sprintf('%03d', $kode);
      }
      $akun->kdak   = $kode;
      $akun->nama   = $nama;

      if (!$akun->save()) {
        $this->flash->error($akun->getMessages());
      } else {
        $this->flashSession->success("Kode barang ".$nama." berhasil ditambahkan");
        $this->response->redirect("kode_barang/jenis/".$akun->level.'/'.$akun->parent.'/'.$tmpKode);
      }
    }
  }

  public function deleteJenisAction($level,$idak,$tmpKode)
  {
    $akun = Akun::findFirstByIdak($idak);
    if (!$akun) {

        $this->flashSession->error("Akun was not found");

        $this->response->redirect("kode_barang/jenis/".$akun->parent);
    }

    if (!$akun->delete()) {
        $this->flashSession->error($akun->getMessages());
    } else {
        $this->flashSession->success($akun->nama." was deleted");
    }

    $this->response->redirect("kode_barang/jenis/".$level.'/'.$akun->parent.'/'.$tmpKode);
  }

  public function objekAction()
  {
    # code...
  }

  public function rincianObjAction()
  {
    # code...
  }

  public function subRincianObjAction()
  {
    # code...
  }

  public function subSubRincianObjAction()
  {
    # code...
  }

}