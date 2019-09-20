public class SOQLDMLExample {
	private List<Contact> contactList = [SELECT lastname, firstname, id, email, phone, OwnerID, account.phone 
                                         FROM Contact
                                         WHERE email = null OR phone = null];
    public void dataCompltenessCheck(){
        List<Contact>updateList = new List<Contact>();
        List<Task>insertTaskList = new List<Task>();
        for(Contact c: contactList){
            if(c.email == null && c.phone == null){
                insertTaskList.Add(createTask(c));
                updatePhone(c);
                updateList.add(c);
            }else if(c.phone == null){
                if(c.account.phone == null){
                    insertTaskList.Add(createTask(c));
                }else{
                    updatePhone(c);
                    updateList.add(c);
                }
            }else if(c.email == null){
                insertTaskList.Add(createTask(c));
            }
        }
        Savepoint sp = database.SetSavepoint(); //savepoint in database
        insert insertTaskList; //DML
        database.update(updateList, false); //Partial success
        database.rollback(sp); 
    }
    private task createTask(Contact c){
        Task newTask = new Task();
        newTask.subject = 'Accquire contact details for client/account';
        newTask.OwnerId = c.OwnerID;
        newTask.WhoId = c.ID;
        return newTask;
    }
    
    private Contact updatePhone(Contact c){
        c.phone = c.account.phone;
        return c;
    }
}