<?php
namespace Vokuro\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Vokuro\Models\UserLog;

/**
 * ControllerBase
 * This is the base controller for all controllers in the application
 *
 * @property \Vokuro\Auth\Auth auth
 */
class ControllerBase extends Controller
{
  /**
   * Execute before the router so we can determine if this is a private controller, and must be authenticated, or a
   * public controller that is open to all.
   *
   * @param Dispatcher $dispatcher
   * @return boolean
   */
  public function beforeExecuteRoute(Dispatcher $dispatcher)
  {
    define('LIST_LIMIT', 10);    
    $controllerName = $dispatcher->getControllerName();

    // Only check permissions on private controllers
    if ($this->acl->isPrivate($controllerName)) {

      // Get the current identity
      $identity = $this->auth->getIdentity();

      // If there is no identity available the user is redirected to index/index
      if (!is_array($identity)) {

        $this->flash->notice('You don\'t have access to this module: private');

        $dispatcher->forward([
          'controller' => 'index',
          'action' => 'index'
        ]);
        return false;
      }

      // Check if the user have permission to the current option
      $actionName = $dispatcher->getActionName();
      if (!$this->acl->isAllowed($identity['profile'], $controllerName, $actionName)) {

        $this->flash->notice('You don\'t have access to this module: ' . $controllerName . ':' . $actionName);

        if ($this->acl->isAllowed($identity['profile'], $controllerName, 'index')) {
          $dispatcher->forward([
            'controller' => $controllerName,
            'action' => 'index'
          ]);
        } else {
          $dispatcher->forward([
            'controller' => 'user_control',
            'action' => 'index'
          ]);
        }

        return false;
      }
    }
    
    $data = [
        "uri" => $this->router->getRewriteUri(),
        "content" => $_POST
    ];

    $user_log = new UserLog();
    $user_log->user_id = $this->auth->getUser()->id;
    $user_log->data = json_encode($data);
    $user_log->save();
  }
  
  protected function _redirectBack() {
    return $this->response->redirect($this->request->getServer('HTTP_REFERER'));
  }

}
