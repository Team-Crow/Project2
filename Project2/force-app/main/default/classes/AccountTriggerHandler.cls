public class AccountTriggerHandler {
    public static void createDefaultContact(List<Account> newAccounts){
        Set<ID> accIDSet = new Set<ID>();
        for(Account a: newAccounts){
            accIDSet.add(a.id);
        }
        List<Contact> contactList = new List<Contact>();
        Contact c = new Contact();
        
       	List<Account> accountList=[select id, name, phone, (select Lastname from contacts) from Account where id IN :accIDSet];
		for(Account a: accountList){
			if(a.Contacts.isEmpty()){
				c.AccountId = a.Id;
                c.Phone = a.Phone;
        		c.LastName= 'default';
                contactList.add(c);
			}	
		}
       	database.insert(contactList, false);
    }
}