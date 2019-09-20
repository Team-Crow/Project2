trigger AttemptTrigger on Attempt__c (after insert, after update) {
    AttemptTriggerHandler.createDefaultAnswers(Trigger.New);
    if(Trigger.isUpdate)
        AttemptTriggerHandler.updatePlayer();
}