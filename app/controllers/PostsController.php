<?php

namespace Vokuro\Controllers;

class PostsController extends ControllerBase
{

  public function initialize()
  {
    $this->view->setTemplateBefore("private");
  }

  public function indexAction()
  {
    echo "Tara!";
  }

}

