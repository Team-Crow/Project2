///////////////////////////////////////////////////////////////
//
// ContactTrigger 
// Author: Harvey Hill
// Created 8/27/19
// Description: Trigger to handle events on the contact object.
// 
//////////////////////////////////////////////////////////////

trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert){
        ContactTriggerHandler.checkForDuplicates(Trigger.New);
    }
}