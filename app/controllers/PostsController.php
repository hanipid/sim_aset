<?php
namespace Vokuro\Controllers;

use Phalcon\Mvc\Model\Criteria;
use Vokuro\Models\Posts;
use Vokuro\Models\Categories;
use Phalcon\Paginator\Adapter\Model as Paginator;

class PostsController extends ControllerBase
{

  public function initialize()
  {
		$this->view->setTemplateBefore("private");
  }

  // public function indexAction($category = null, $keywords = null, $numberPage = 1)
  public function indexAction($numberPage = 1)
  {
    $category = $this->request->getQuery("c", "int");
    $keywords = $this->request->getQuery("q", "string");

    // $category = $this->filter->sanitize($category, "int");
    // $keywords = $this->filter->sanitize($keywords, "string");
    $keyword = explode(" ", $keywords);
    $i = 0;
    foreach ($keyword as $keys) {
      if ($keys === end($keyword)) {
        $q .= "title like '%".$keys."%'";
      } else {
        $q .= "title like '%".$keys."%' OR ";
      }
    }
    // var_dump($q);
    if ($category != null) {
      $param = "(post_type = :t: AND (status = :p: OR status = :d:)) AND category = ".$category;
    } else {
      $param = "(post_type = :t: AND (status = :p: OR status = :d:)) AND ".$q;
    }
    // var_dump($param);

    $parameters= [
        $param,
        "bind" => [
            "t" => "post",
            "p" => "publish",
            "d" => "draft"
        ],
        "order" => "id DESC",
    ];

    $posts = Posts::find($parameters);

    $paginator = new Paginator(array(
        'data' => $posts,
        'limit'=> 8,
        'page' => $numberPage
    ));

    $this->view->page = $paginator->getPaginate();
    $this->view->keywords = $keywords;
    $this->view->category = $category;
  }

  public function createAction($id = null)
  {
    $this->view->categories = Categories::find([
      "type = :type1: OR type = :type2:",
      "bind" => [ "type1" => 1, "type2" => 0 ]
    ]);

    if (isset($id)) { // If Edit Post
      $post = Posts::findFirstById($id);

      $this->view->p = $post;
      $this->tag->setDefault("post_title", $post->title);
      $this->tag->setDefault("post_content", $post->content);
      $this->tag->setDefault("published_at", $post->published_at);
      $this->tag->setDefault("comment_status", $post->comment_status);
      $this->tag->setDefault("post_url", $post->url);
      $this->tag->setDefault("column_set", $post->column_set);
      $this->tag->setDefault("post_status", $post->status);

    } else {
      $this->view->post = Posts::find();
    }

  	if ($this->request->isPost()) {

			$id = $this->request->getPost("id");

      /**
      * create unique url
      **/
      $post_url = $this->request->getPost("post_url");
      $posts = Posts::find();
      $c_url = null;
      foreach ($posts as $ps) {
        if ($ps->url == $post_url AND $ps->id != $id) {
          $c_url += rand(1000, 9999);
          $post_url .= "-" . $c_url;
        }
      }

      // Used for autosave
      $new_post = $this->request->getPost("new_post");
      if ($new_post != "1") {
          $post = Posts::findFirstById($id);
      } else {
          $post = new Posts();
      }

      if (!$post) {
        $this->flash->error("Failed! " . $id . $new_post);
        $this->dispatcher->forward(array(
          'controller' => "posts",
          'action' => 'index'
        ));
        return;
      }

      $post->author = $this->request->getPost("post_author");
      $post->content = $this->request->getPost("post_content");
      $post->title = $this->request->getPost("post_title");
      $post->url = $post_url;
      $post->status = $this->request->getPost("post_status");
      $post->category = $this->request->getPost("post_category");
      $post->comment_status = $this->request->getPost("comment_status");
      $post->images = "-";
      $post->post_type = $this->request->getPost("post_type");
      $post->column_set = $this->request->getPost("column_set");
      $post->published_at = $this->request->getPost("published_at");
      $post->created_at = $this->request->getPost("created_at");
      $post->updated_at = $this->request->getPost("updated_at");

      if (!$post->save()) {
        foreach ($post->getMessages() as $message) {
            $this->flash->error($message."-".var_dump($new_post));
        }
        $this->dispatcher->forward(array(
            'controller' => "posts",
            'action' => 'create'
        ));
        return;
      }

      $this->flash->success("post was saved successfully");
      $this->dispatcher->forward(array(
          'controller' => "posts",
          'action' => 'index'
      ));

  	}
  }

  public function deleteAction($id)
  {
    $post = Posts::findFirstById($id);
    if (!$post) {
      $this->flash->error("post was not found");

      $this->dispatcher->forward(array(
          'controller' => "posts",
          'action' => 'index'
      ));

      return;
    }

    $post->status = "trash";

    if (!$post->save()) {

        foreach ($post->getMessages() as $message) {
            $this->flash->error($message);
        }

        $this->dispatcher->forward(array(
            'controller' => "posts",
            'action' => 'index'
        ));

        return;
    }

    $this->flash->success("post was moved to trash successfully");

    $this->dispatcher->forward(array(
        'controller' => "posts",
        'action' => "index"
    ));
  }

}

