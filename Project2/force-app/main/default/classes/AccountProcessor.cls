public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> AccountIds){
        List<Account> accs = [SELECT Id, Number_of_Contacts__c, (SELECT LastName FROM Contacts) FROM Account WHERE Id In: AccountIds];
        for(Account a: accs){
            List<Contact> conList = a.Contacts;
            a.Number_of_Contacts__c = conList.size();
        }
        update accs;
    }
}