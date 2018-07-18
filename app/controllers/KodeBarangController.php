<?php
namespace Vokuro\Controllers;

use Vokuro\Models\Akun;
use Vokuro\Models\VKodeBarang;
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

    $v_kode_barang = VKodeBarang::find([
      "nama LIKE ?1",
      "bind" => ["1" => '%'.$keywords.'%']
    ]);

    $paginator = new PaginatorModel(
      [
        'data'  => $v_kode_barang,
        'limit' => LIST_LIMIT,
        'page'  => $currentPage,
      ]
    );

    $this->view->setVars([
      'paginator' => $paginator->getPaginate(),
      'keywords' => $keywords
    ]);
  }

  public function createKodeAction($kode)
  {
    $this->view->disable();
    $VKodeBarang  = VKodeBarang::findFirstByKode($kode);
    $level = $VKodeBarang->level;
    $kodeTemp = explode('.', $kode);
    $kodeRanting = $kodeTemp[0];
    for ($i=1; $i < $level - 1 ; $i++) { 
      $kodeRanting .= '.'.$kodeTemp[$i];
    }
    $kodeDaun     = $kodeTemp[$level - 1];
    echo '<div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <input type="hidden" class="form-control" name="parentIdak" id="parentIdak" placeholder="Kode" value="'.$VKodeBarang->idak.'">
              <input type="hidden" class="form-control" name="parentLevel" id="parentLevel" placeholder="Level" value="'.$level.'">
              <input type="hidden" class="form-control" name="kodeRanting" id="kodeRanting" placeholder="Kode Ranting" value="'.$kodeRanting.'">
              <div class="input-group">
                <span class="input-group-addon">'.$kode.'. </span>
                <input type="text" class="form-control" name="kode" id="kode" placeholder="Kode">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="nama" class="col-sm-3 control-label">Uraian</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama" id="nama" placeholder="Uraian">
            </div>
          </div>';

    if ($this->request->isPost()) {
      $parentIdak = $this->request->getPost("parentIdak");
      $kodeDaun   = $this->request->getPost("kode");
      $nama       = $this->request->getPost("nama");
      $level      = $this->request->getPost("parentLevel") + 1;

      $akun = new Akun();
      if ($level == 4 OR $level == 5 OR $level == 6) {
        $kodeDaun = sprintf('%02d', $kodeDaun);
      } elseif ($level == 7) {
        $kodeDaun = sprintf('%03d', $kodeDaun);
      }

      // cek jika nomor kode terjadi duplikasi
      $findParent = Akun::find([
        "parent = ?1",
        "bind" => [ 1 => $parentIdak ]
      ]);
      $found = false;
      $i=0;
      foreach ($findParent as $fp) {
        if ($fp->kdak == $kodeDaun) {
          // ada kode yang sama
          $found = true;
          $i++;
          $fidak = $fp->idak;
        }
      }

      if (!$found) {
        $akun->kdak   = $kodeDaun;
        $akun->nama   = $nama;
        $akun->level  = $level;
        $akun->parent = $parentIdak;
        $akun->status = 1;

        if (!$akun->save()) {
          $this->flash->error($akun->getMessages());
        } else {
          $this->flashSession->success("Kode barang ".$nama." berhasil dibuat");
          $this->response->redirect("kode_barang/index/");
        }
      } else {
        $this->flashSession->error("Kode barang ".$nama." harus unik");
        $this->response->redirect("kode_barang/index/");
      }
    }
  }

  public function editKodeAction($kode)
  {
    $this->view->disable();

    // $akun   = Akun::findFirstByIdak($idak);
    $VKodeBarang  = VKodeBarang::findFirstByKode($kode);
    $level = $VKodeBarang->level;
    $kodeTemp = explode('.', $kode);
    $kodeRanting = $kodeTemp[0];
    for ($i=1; $i < $level - 1 ; $i++) { 
      $kodeRanting .= '.'.$kodeTemp[$i];
    }
    $kodeDaun     = $kodeTemp[$level - 1];
    echo '<div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <input type="hidden" class="form-control" name="idak" id="idak" placeholder="Kode" value="'.$VKodeBarang->idak.'">
              <input type="hidden" class="form-control" name="level" id="level" placeholder="Level" value="'.$level.'">
              <input type="hidden" class="form-control" name="kodeRanting" id="kodeRanting" placeholder="Kode Ranting" value="'.$kodeRanting.'">
              <div class="input-group">
                <span class="input-group-addon">'.$kodeRanting.'. </span>
                <input type="text" class="form-control" name="kodeDaun" id="kodeDaun" placeholder="Kode" value="'.$kodeDaun.'">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="nama" class="col-sm-3 control-label">Uraian</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama" id="nama" placeholder="Uraian" value="'.$VKodeBarang->nama.'">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
              <a href="'.$this->url->getBaseUri().'kode_barang/deleteKode/'.$VKodeBarang->idak.'" class="btn btn-danger btn-sm" onclick="return confirm(\'Apakah Anda yakin?\')">Delete</a>
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

      // cek jika nomor kode terjadi duplikasi
      $findParent = Akun::find([
        "parent = ?1 AND idak != ?2",
        "bind" => [
          1 => $akun->parent,
          2 => $akun->idak
        ]
      ]);
      $found = false;
      $i=0;
      foreach ($findParent as $fp) {
        if ($fp->kdak == $kode) {
          // ada kode yang sama
          $found = true;
          $i++;
          $fidak = $fp->idak;
        }
      }

      if (!$found) {
        $akun->kdak   = $kode;
        $akun->nama   = $nama;

        if (!$akun->save()) {
          $this->flash->error($akun->getMessages());
        } else {
          $this->flash->success("Kode barang ".$nama." berhasil diubah");
          // $this->response->redirect("kode_barang/index/");
        }
      } else {
        $this->flashSession->error("Kode barang ".$nama." harus unik");
      }
      
    }
  }

  public function deleteKodeAction($idak)
  {
    $akun = Akun::findFirstByIdak($idak);
    if (!$akun) {

        $this->flashSession->error("Akun tidak ada");

        $this->response->redirect("kode_barang/index/");
    }

    if (!$akun->delete()) {
        $this->flashSession->error($akun->getMessages());
    } else {
        $this->flashSession->success($akun->nama." was deleted");
    }

    $this->response->redirect("kode_barang/index/");
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