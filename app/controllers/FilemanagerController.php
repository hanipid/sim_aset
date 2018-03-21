<?php
namespace Vokuro\Controllers;

/**
 * View and define permissions for the various profile levels.
 */
class FilemanagerController extends ControllerBase
{
  public function saveAction() {
    $namafile = $_FILES['file']['name'];
    $tipefile = $_FILES['file']['type'];
    $namafile = strtolower($namafile);
    $tipefile = strtolower($tipefile);



    if ($_FILES['file']['name']) {

      if (!$_FILES['file']['error']) {

        $name = date('YmdHis');
        $ext = explode('.', $_FILES['file']['name']);
        $file_ext = strrchr($namafile, '.');

        //check if its allowed or not
        $whitelist = array(".jpg",".jpeg",".gif",".png",".JPG",".JPEG",".PNG",".GIF");
        if (!(in_array($file_ext, $whitelist))) {
           die('upload file gambar ditolak.');
        }

        //check upload type
        $pos = strpos($tipefile,'image');
        if($pos === false) {
          die('error 1');
        }
        $imageinfo = getimagesize($_FILES['file']['tmp_name']);
        if($imageinfo['mime'] != 'image/gif'
        && $imageinfo['mime'] != 'image/jpeg'
        && $imageinfo['mime'] != 'image/jpg'
        && $imageinfo['mime'] != 'image/png') {
          die('error 2');
        }

        //check double file type (image with comment)
        if(substr_count($tipefile, '/')>1){
          die('error 3');
        }
        $filename = $name . '.' . $ext[1];
        $destination = 'uploads/posts/' . $filename; //edit path
        $location = $_FILES["file"]["tmp_name"];

        $img = new \Phalcon\Image\Adapter\Gd($location);
        if($img->getWidth() > 1200 OR $img->getHeight() > 1200)
          {
          $img->resize(1200,1200);
        }
        $img->save($destination,'75');

        $return_data = array('error'=>0,'content'=>'http://' . $_SERVER['SERVER_NAME'] . $this->config->application->baseUri . $destination);
        echo json_encode($return_data);
        $this->view->disable();
      }
      else
      {
        echo  $message = 'Ooops!  Your upload triggered the following error:  '.$_FILES['file']['error'];
      }
    }
  }

  public function deleteAction()
  {
    $img = $_POST['image'];
    if (file_exists( 'uploads/posts/'.$img))
    unlink('uploads/posts/'.$img);

  }
}
