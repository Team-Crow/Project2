@isTest
public class LeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> leadList = new List<Lead>();
        
        for(Integer i=0;i<200;i++){
            leadList.add(new Lead(LastName = 'TestLead ' + i, Company ='TestCompany', Status ='Open - Not Contacted'));
        }
        Insert leadList;
    }
    
    @isTest
    static void test(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        List<Lead> leads = [SELECT LeadSource FROM Lead WHERE LastName LIKE 'TestLead%'];
        for(Lead l: leads){
        	System.assertEquals('Dreamforce', l.LeadSource);        
        }
    }
}