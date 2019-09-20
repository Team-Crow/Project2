public class WrapperClass {
    public List<wrapAccount> wrapAccountList{get;set;}
    public List<Account> selectedAccounts{get;set;}
    
    public WrapperClass(){
        wrapAccountList = new List<wrapAccount>();
        for(Account a: [SELECT Name, Phone, BillingState
                        FROM Account ORDER BY Name]){
            wrapAccountList.add(new wrapAccount(a));
        }
    }
    
    public void changeStateToCA(){
        selectedAccounts = new List<Account>();
        for(wrapAccount w: wrapAccountList){
            if(w.selected == true){
                w.selected = false;
                Account selectedAccount = w.account;
                selectedAccount.BillingState = 'CA';
                selectedAccounts.add(selectedAccount);
            }
        }
    }
    
    public void removeState(){
        selectedAccounts = new List<Account>();
        for(wrapAccount w: wrapAccountList){
            if(w.selected == true){
                w.selected = false;
                Account selectedAccount = w.account;
                selectedAccount.BillingState = null;
                selectedAccounts.add(selectedAccount);
            }
        }
    }
       
    public class wrapAccount{
        public Account account{get;set;}
        public Boolean selected{get;set;}
        
        public wrapAccount(Account a){
            account = a;
            selected = false;
        }
    }
}