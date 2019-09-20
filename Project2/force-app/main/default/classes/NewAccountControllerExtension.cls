public class NewAccountControllerExtension {
	apexpages.StandardController stdController;
    private Contact childContact;
    public NewAccountControllerExtension(ApexPages.StandardController stdController){
        childContact = new Contact();
        this.stdController = stdController;
    }
    
    public Contact getChildContact(){
        return childContact;
    }
    
    public void setChildContact(Contact newContact){
        this.childContact = newContact;
    }
    
    public pagereference SaveAccountAndContact(){
        stdController.save();
        childContact.accountid = stdController.getId();
        insert childContact;
        return stdController.view();
    }
}