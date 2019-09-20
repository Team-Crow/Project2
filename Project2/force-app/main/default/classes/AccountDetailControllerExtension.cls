public class AccountDetailControllerExtension {
	apexpages.StandardController stdController;
    private Contact childContact;
    public AccountDetailControllerExtension(ApexPages.StandardController stdController){
        childContact = new Contact();
        this.stdController = stdController;
    }
    
    public Contact getChildContact(){
        return childContact;
    }
    
    public void setChildContact(Contact newContact){
        this.childContact = newContact;
    }
}