<?php
namespace Vokuro\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Vokuro\Models\Categories;

/**
* 
*/
class CategoriesForm extends Form
{
  
  public function initialize($entity = null, $options = null)
  {
    // Check if Edit Action
    if (isset($options['edit']) && $options['edit']) {

      $criteria = "(id != 0 AND id != :categoryId: AND type = :type:) OR parent > :categoryId:";
      $bind = [
        'categoryId' => $entity->id,
        'type' => $options['type']
      ];

    } else {

      $criteria = "id != 0 AND type = :type:";
      $bind = [
        'type' => $options['type']
      ];

    }

    // Category Name
    $name = new Text('name', [
      'class' => 'form-control'
    ]);

    $name->addValidators([
      new PresenceOf([
        'message' => 'Category name is required'
      ])
    ]);

    $this->add($name);


    // Category Type
    $type = new Hidden('type', [
      'value' => $options['type'],
      'class' => 'form-control'
    ]);
    $this->add($type);


    // Category Parent
    $categories = Categories::find([
      $criteria,
      'bind' => $bind
    ]);
    $parent = new Select('parent', $categories, [
      'using' => [
        'id', 'name'
      ],
      'useEmpty' => true,
      'emptyText' => 'None',
      'emptyValue' => 0,
      'class' => 'form-control'
    ]);
    $this->add($parent);
  }
}