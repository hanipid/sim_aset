<?php
namespace Vokuro\Controllers;

use Phalcon\Mvc\Controller;
use Vokuro\Models\MenuSidebar;
use Vokuro\Models\Profiles;

/**
 * Controller Menu
 */
class MenusController extends Controller
{
	public function initialize()
	{
		$this->view->setTemplateBefore("private");
	}

  public function orderAction() {
		$request = $this->request;

		if ($request->isPost()) {
			if ($request->isAjax()) {
				$this->view->disable();
				$i = 0;
				$v = $request->getPost("id");
				print_r($v);
				foreach ($v as $id) {
					// Execute statement:
					// UPDATE [Table] SET [Position] = $i WHERE [EntityId] = $value
					$modules = MenuSidebar::findFirstById($id);
					$modules->sort = $i;
					echo $modules->name."-".$id."-".$i;
					echo "<br>";
					// $modules->save();
					if (!$modules->save()) {
						foreach ($modules->getMessages() as $message) {
							echo $message . "\n";
							$this->flash->error((string) $message);
							// return $this->response->redirect("module/lihat");
						}
					}
					$i++;
				}
				return $this->response->redirect("menus");
			}
		}
	}

	public function indexAction()
	{
		$menu_sidebar = MenuSidebar::find([
			"parent = 0",
			"order" => "sort"
		]);
		$profiles = Profiles::find();
		$this->view->setVars([
			"menu_sidebar" => $menu_sidebar,
			"profiles" => $profiles
		]);
	}

	public function createAction()
	{
		$parent = MenuSidebar::find([
			"parent = 0"
		]);
		$profiles = Profiles::find();
		$this->view->setVars([
			"parent" => $parent,
			"profiles" => $profiles
		]);

		$request = $this->request;
		if ($request->isPost()) {
			$menu_sidebar 				= new MenuSidebar();
			$menu_sidebar->name 	= $request->getPost("name");
			$menu_sidebar->url 		= $request->getPost("url");
			$menu_sidebar->parent = $request->getPost("parent");
			$menu_sidebar->profiles = json_encode($request->getPost("profiles"));

			if (!$menu_sidebar->save()) {
				foreach ($menu_sidebar->getMessages() as $m) {
					$this->flashSession->error("Terjadi kesalahan saat membuat menu baru. " . $m);
				}
			} else {
				$this->flashSession->success("Menu baru berhasil dibuat");
			}

			$this->response->redirect("menus");
		}
	}
}