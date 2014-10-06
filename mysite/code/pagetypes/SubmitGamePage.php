<?php
/**
 *
 */
class SubmitGamePage extends Page {

	private static $hide_ancestor = "MemberProfilePage";

	private static $icon = "gamesevent/images/pacman.png";

	private static $db = array(
		'LoggedOutMessage'=>'HTMLText',
		'AfterSubmissionContent'=>'HTMLText'
	);
	private static $has_one = array(
		'Game'=> 'Game'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->insertAfter($submitted = new HtmlEditorField('AfterSubmissionContent'), 'Content');
		$submitted->setRows(20);
		$submitted->setRightTitle('Displayed after a user submits a game for approval');

		$fields->insertAfter($loggedOut = new HtmlEditorField('LoggedOutMessage'), 'Content');
		$loggedOut->setRows(20);

		return $fields;
	}
}

class SubmitGamePage_Controller extends Page_Controller {

	private static $allowed_actions = array (
		'Form',
		'aftersubmission',
		'addgamesubmission'
	);

	/**
	 * Attempts to save a game 
	 *
	 * @return Member|null
	 */
	protected function addGame($form) {
		$siteConfig = SiteConfig::current_site_config();

		$member = Member::currentUser();

		$game = Game::create();
		
		$form->saveInto($game);

		$game->FacilitatorID = $member->ID;
		$game->ParentID = $siteConfig->CurrentEventID;

		try {
			$game->write();
		} catch(ValidationException $e) {
			$form->sessionMessage($e->getResult()->message(), 'bad');
			return;
		}

		return $game;
	}

	/**
	 * Handles adding new games
	 */
	public function addgamesubmission($data, Form $form) {
		if($game = $this->addGame($form)) {

			return $this->redirect($this->Link('aftersubmission'));
		} else {
			return $this->redirectBack();
		}
	}

	/**
	 * Returns the after submission content to the user.
	 *
	 * @return array
	 */
	public function aftersubmission() {
		return array (
			'Title'   => "Game Submitted!",
			'Content' => $this->obj('AfterSubmissionContent'),
			'Form' => false
		);
	}

	/**
	 * @uses MemberProfilePage_Controller::getProfileFields
	 * @return Form
	 */
	public function Form() {
		$fields = $this->GameFields();

		$form = new Form (
			$this,
			'Form',
			$fields,
			new FieldList(
				new FormAction('addgamesubmission', 'Submit')
			)
		);

		return $form;
	}

	public function GameFields(){
		$fields = new FieldList();

		$fields->push(new TextField('Title'));
		$fields->push(new TextField('Genre', 'Genre'));
		$fields->push(new TextField('Restriction', 'Restriction (R18, PG, etc)'));

		$briefEditor = new TextAreaField('Brief', 'Abstract');
		$briefEditor->setRows(5);
		$fields->push($briefEditor);

		$detailsEditor = CompositeField::create(
			new LabelField('GameDetails', 'Game Details'),
			$html = new HTMLEditorField('Details'),
			new LiteralField('editorDiv', '<div class="editable"></div>')
		);
		$fields->push($detailsEditor);
		$html->addExtraClass('hide');
		$detailsEditor->addExtraClass('field');

		$costuming = new TextAreaField('Costuming', 'Costuming');
		$costuming->setRows(5);
		$fields->push($costuming);

		$fields->push(new TextField('NumPlayers', 'Number of players'));
		$fields->push(new NumericField('Session', 'Preferred Session (number)'));

		return $fields;
	}
}