public with sharing class CustomController {
    public Integer rec { get; set; }
    public Integer tot { get; set; }
   	integer totalRecs = 0;
   	integer count= 0;
   	integer LimitSize= 5;

	public CustomController(){
    	tot=totalRecs = [select count() from contact];
    }
    
    public List<Contact> contacts=new List<Contact>();
   	public List<Contact> getContacts() {
   		List<Contact> ld=[select FirstName, LastName,Email, Phone from Contact ORDER BY LastName LIMIT:limitsize OFFSET:count];
        //system.debug('values are:' + ld);
        return ld;
    }
    
    public void updatePage() {
        contacts.clear();
        limitsize=rec;
        contacts=[select FirstName, LastName,Email, Phone from Contact ORDER BY LastName LIMIT:rec OFFSET:count];
    }
    
    public PageReference prvbtn() {
    	count=count-limitsize;
        return null;
    }

 	public PageReference Nxtbtn() {
 		count=count+limitsize;
        return null;
    }
 
    public Boolean getNxt() {
        if((count+ LimitSize) >= totalRecs)
       		return true;
     	else
       		return false;     
    }
    
    public Boolean getPrv() {
       if(count== 0)
           return true;
       else
           return false;
    }
}