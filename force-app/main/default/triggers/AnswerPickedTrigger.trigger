trigger AnswerPickedTrigger on Answer__c (after update) {
	AnswerPickedTriggerHandler.updateQuestion();
}