<?php
namespace Vokuro\Controllers;

use Phalcon\Tag;
use Vokuro\Models\BasicSettings;
use Vokuro\Forms\BasicSettingsForm;

class BasicSettingsController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

	public function indexAction()
	{
		$basicSettings = BasicSettings::findFirstById(1);

		if ($this->request->isPost()) {

			if ($this->request->hasFiles()) {
				foreach ($this->request->getUploadedFiles() as $file) {

					$namafile = $file->getName();
					$tipefile = $file->getType();
					$namafile = strtolower($namafile);
					$tipefile = strtolower($tipefile);

					if ($file->getName()) {
						if (!$file->getError()) {
							$name = date('YmdHis');
							$ext = explode('.', $file->getName());
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

							$imageinfo = getimagesize($file->getTempName());
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

							$filename = 'Logo.' . $ext[1];
							$destination = 'uploads/basic_settings/' . $filename; //edit path
							$location = $file->getTempName();
							// $website_data->logo = $filename;
							// move_uploaded_file($location, $destination);

							$img = new \Phalcon\Image\Adapter\Gd($location);
							if($img->getWidth() > 400 OR $img->getHeight() > 400) {
							  $img->resize(400,400);
							}
							$img->save($destination,'75');

							// $return_data=array('error'=>0,'content'=>'http://' . $_SERVER['SERVER_NAME'] . '/' . $destination);
							// echo json_encode($return_data);
							// $this->view->disable();
						} else {
						  echo  $message = 'Ooops!  Your upload triggered the following error:  '.$file->getError();
						}
					} // if file getname()
				} // foreach file
			} // if has files

			$basicSettings->assign([
				'site_name'         => $this->request->getPost('site_name', 'striptags'),
				'meta_title'        => $this->request->getPost('meta_title', 'striptags'),
				'meta_description'  => $this->request->getPost('meta_description', 'striptags'),
				'address'           => $this->request->getPost('address', 'striptags'),
				'phone_number'      => $this->request->getPost('phone_number', 'striptags'),
				'email'             => $this->request->getPost('email', 'email'),
				'currency'          => $this->request->getPost('currency', 'int'),
				'ss_speed'          => $this->request->getPost('ss_speed', 'int'),
				'logo'							=> $filename
			]);

			$form = new BasicSettingsForm($basicSettings);

			if ($form->isValid($this->request->getPost()) == false) {

				foreach ($form->getMessages() as $message) {
					$this->flash->error($message);
				}

			} else {

				if (!$basicSettings->save()) {
					$this->flash->error($basicSettings->getMessages);
				} else {
					$this->flash->success("Basic settings was updated successfully");
				}

			}
		}

		$this->view->basicSettings = $basicSettings;

		$this->view->form = new BasicSettingsForm($basicSettings);
	}

	public function deleteLogoAction()
	{
		$basicSettings = BasicSettings::findFirstById(1);

		unlink("uploads/basic_settings/".$basicSettings->logo);

		$basicSettings->logo = null;

		if (!$basicSettings->save()) {
			$this->flashSession->error($basicSettings->getMessages);
		} else {
			$this->flashSession->success("Logo was deleted successfully");
		}

		$this->response->redirect('basic_settings/index');
	}

}