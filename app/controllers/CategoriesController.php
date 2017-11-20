<?php
namespace Vokuro\Controllers;

use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Vokuro\Models\Categories;
use Vokuro\Forms\CategoriesForm;

class CategoriesController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateBefore("private");
    }
    
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
        // $this->view->form = new CategoriesForm(null);
        $postCategories = Categories::find([
            'parent = 0 AND type = 1'
        ]);
        $this->view->setVar('post_categories', $postCategories);
        $productCategories = Categories::find([
            'parent = 0 AND type = 2'
        ]);
        $this->view->setVar('product_categories', $productCategories);
    }

    /**
     * Searches for categories
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, '\Vokuro\Models\Categories', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $categories = Categories::find($parameters);
        if (count($categories) == 0) {
            $this->flash->notice("The search did not find any categories");

            $this->dispatcher->forward([
                "controller" => "categories",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $categories,
            'limit'=> 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Edits a categorie
     *
     * @param string $id
     */
    public function editAction($type, $id)
    {
        $categorie = Categories::findFirstByid($id);
        if (!$categorie) {
            $this->flash->error("categorie was not found");

            $this->dispatcher->forward([
                'controller' => "categories",
                'action' => 'index'
            ]);

            return;
        }

        if ($this->request->isPost()) {


            $categorie->name = $this->request->getPost("name");
            $categorie->parent = $this->request->getPost("parent");
            $categorie->type = $this->request->getPost("type");
            

            if (!$categorie->save()) {

                foreach ($categorie->getMessages() as $message) {
                    $this->flash->error($message);
                }

                $this->dispatcher->forward([
                    'controller' => "categories",
                    'action' => 'edit',
                    'params' => [$categorie->id]
                ]);

                return;
            }

            $this->flashSession->success("Category was updated successfully");

            $this->response->redirect("categories/index");
        }
            
        $this->view->form = new CategoriesForm($categorie, [
            'edit' => true,
            'type' => $type
        ]);
    }

    /**
     * Creates a new categorie
     */
    public function createAction($type)
    {
        $form = new CategoriesForm(null,['type' => $type]);
        if ($this->request->isPost()) {

            if ($form->isValid($this->request->getPost()) == false) {
                
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                
            } else {

                $categorie = new Categories();
                $categorie->name = $this->request->getPost("name", 'striptags');
                $categorie->parent = $this->request->getPost("parent", 'int');
                $categorie->type = $this->request->getPost("type", 'int');

                if (!$categorie->save()) {
                    $this->flash->error($categorie->getMessages());
                } else {

                    $this->flashSession->success("Category was created successfully");

                    $this->response->redirect("categories");
                    // Tag::resetInput();
                }
            }
        }

        $this->view->form = $form;
    }

    /**
     * Saves a categorie edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "categories",
                'action' => 'index'
            ]);

            return;
        }

        
    }

    /**
     * Deletes a categorie
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $categorie = Categories::findFirstByid($id);
        if (!$categorie) {
            $this->flash->error("categorie was not found");

            $this->dispatcher->forward([
                'controller' => "categories",
                'action' => 'index'
            ]);

            return;
        }

        if (!$categorie->delete()) {

            foreach ($categorie->getMessages() as $message) {
                $this->flashSession->error($message);
            }

            $this->response->redirect("categories/search");

            return;
        }

        $this->flashSession->success("categorie was deleted successfully");

        $this->response->redirect("categories/index");
    }

}
