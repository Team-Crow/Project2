@isTest
public class TestDataFactory {
    public static List<Account> createAccounts(Integer numAccts, Integer numofEmployees, String accName){
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name= accName, NumberofEmployees = numofEmployees);
            accts.add(a);
        }
        insert accts;
     	return accts;   
    }
    
    
    public static List<Lead> createLead(Integer numLeads, String leadName){
        List<Lead> leads = new List<Lead>();
        
        for(Integer i=0;i<numLeads;i++) {
            Lead l = new Lead(LastName= leadName, Company = 'testing',state = 'CA');
            leads.add(l);
        }
        insert leads;
     	return leads;
    }
    
    public static List<Opportunity> createOpportunity(Integer numOpps, Date closeDate, String oppName){
        List<Opportunity> opps = new List<Opportunity>();
        
        for(Integer i=0;i<numOpps;i++) {
            Date aCloseDate = Date.newInstance(2018, 1, 1);
            Opportunity o = new Opportunity(Name = oppName, StageName = 'Prospecting', CloseDate = aCloseDate);
            opps.add(o);
        }
        insert opps;
     	return opps;
    }
    
    /*
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }*/

}