global class EmailServiceExample implements Messaging.InboundEmailHandler 
{
 global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env)
 {
  // Create an InboundEmailResult object for returning the result of the Apex Email Service
  Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  try 
  {
   List<Contact> contList= [SELECT Id, Name, Email FROM Contact WHERE Email = :email.fromAddress LIMIT 1];
   Task taskObj = new Task();
   taskObj.Description =  email.plainTextBody;
   taskObj.Priority = 'Normal';
   taskObj.Status = 'Inbound Email';
   taskObj.Subject = email.subject;
   taskObj.IsReminderSet = true;
   taskObj.ReminderDateTime = System.now()+1;
   if(contList.size()>0)
   {
    taskObj.WhoId =  contList[0].Id;
   }    
   insert taskObj;    
  }
  catch (Exception e) 
  {
     System.debug('Exception : ' + e);
  }
  result.success = true;
  return result;
 }
}