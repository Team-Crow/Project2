@isTest
public class AccountProcessorTest {
	@isTest
    static void ProcessorTest(){
        Account a = new Account(Name = 'Test Account');
        Insert a;
        Contact con = new Contact(LastName = 'Test', AccountId = a.Id);
        Insert con;
        Set<Id> idSet = new Set<ID>();
        idSet.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(idSet);
        Test.stopTest();
        Account acc = [SELECT Number_of_Contacts__c FROM Account WHERE Id =: a.Id LIMIT 1];
        System.assertEquals(1, Integer.valueOf(ACC.Number_of_Contacts__c));
    }
}