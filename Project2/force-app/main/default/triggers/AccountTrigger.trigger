trigger AccountTrigger on Account (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.createDefaultContact(Trigger.New);
    }
}