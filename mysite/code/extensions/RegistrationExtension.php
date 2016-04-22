<?php
/**
 *
 */

class RegistrationExtension extends DataExtension {
	private static $db = array(
		'NZLarpsMember' => "Enum('Yes, No, I\'d like to join (please tell me how)', 'No')",
		'Gender' => 'Varchar(255)',
		'LarpExperience' => "Enum('Newbie, Novice (a few games played), Veteran', 'Newbie')",
		'Age' => "Enum('Less than 18 (requires parental consent), 18+, Older than I care to mention', '18+')",
		'EmergencyContact' => 'Varchar(255)',
	);

	public function updateCMSFields(FieldList $fields) {
		$fields->removeByName('PlayWith');
		$fields->removeByName('NotPlayWith');
		$fields->removeByName('EventID');
	}
}
class RegistrationPage_ControllerExtension extends DataExtension {

	public function updateRegisterForm(Form $form) {

		$fields = $form->Fields();

		$reg = singleton('Registration');

		$fields->removeByName('PlayWith');
		$fields->removeByName('NotPlayWith');

		$fields->insertAfter(DropdownField::create(
			'NZLarpsMember',
			'NZLarps Member',
			$reg->dbObject('NZLarpsMember')->enumValues()
		), 'Password');

		$fields->insertAfter(DropdownField::create(
			'LarpExperience',
			'Larp experience',
			$reg->dbObject('LarpExperience')->enumValues()
		), 'NZLarpsMember');

		$fields->insertAfter(DropdownField::create(
			'Age',
			'Age',
			$reg->dbObject('Age')->enumValues()
		), 'LarpExperience');


		$fields->insertAfter(TextField::create(
			'EmergencyContact',
			'Emergency contact'
		), 'Age');

		$fields->insertBefore(TextField::create(
			'Gender',
			'What gender would you prefer to play?'
		), 'EmergencyContact');

		$accom = $fields->dataFieldByName('Accommodation');

		if($accom) {
			$accom->setRightTitle('Limited shared area or tenting available.');
		}
	}
}
