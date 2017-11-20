<?php
namespace Vokuro\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Vokuro\Models\Currency;

class BasicSettingsForm extends Form
{

	public function initialize($entity = null, $options = null)
	{
		// Site Name
		$siteName = new Text('site_name', [
			'class' => 'form-control'
		]);

		$siteName->addValidators([
			new PresenceOf([
				'message' => 'The website name is required'
			])
		]);

		$this->add($siteName);

		// Meta Title
		$metaTitle = new Text('meta_title', [
			'class' => 'form-control'
		]);

		$metaTitle->addValidators([
			new PresenceOf([
				'message' => 'The meta title is required'
			])
		]);

		$this->add($metaTitle);

		// Meta Description
		$metaDescription = new Text('meta_description', [
			'class' => 'form-control'
		]);

		$metaDescription->addValidators([
			new PresenceOf([
				'message' => 'The meta description is required'
			])
		]);

		$this->add($metaDescription);

		// Address
		$address = new Text('address', [
			'class' => 'form-control'
		]);

		$this->add($address);

		// Phone Number
		$phoneNumber = new Text('phone_number', [
			'class' => 'form-control'
		]);

		$this->add($phoneNumber);

		// Email
		$email = new Text('email', [
			'class' => 'form-control'
		]);

		$this->add($email);

		// Logo
		$logo = new File('logo', [
			'class' => 'form-control'
		]);

		$this->add($logo);

		// Currency
		$mdl_currency = Currency::find();
		$currency = new Select('currency', $mdl_currency, [
			'using' => [
				'id',
				'entity'
			],
			'useEmpty' => true,
			'emptyText' => '...',
			'emptyValue' => '',
			'class' => 'form-control'
		]);

		$this->add($currency);

		// Carousel Speed
		$ssSpeed = new Select('ss_speed', [
			"3000" => "3 seconds", 
			"5000" => "5 seconds", 
			"10000" => "10 seconds"
		],
		[
			'useEmpty' => true,
			'emptyText' => '...',
			'emptyValue' => '',
			'class' => 'form-control'
		]);

		$this->add($ssSpeed);

		// ID
		$id = new Hidden('id');

		$this->add($id);

		// Sign Up
		$this->add(new Submit('Save', [
			'class' => 'btn btn-primary'
		]));
	}

	/**
	 * Prints messages for a specific element
	 */
	public function messages($name)
	{
		if ($this->hasMessagesFor($name)) {
			foreach ($this->getMessagesFor($name) as $message) {
				$this->flash->error($message);
			}
		}
	}
}
