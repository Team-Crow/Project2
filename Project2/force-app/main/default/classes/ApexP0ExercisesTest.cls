@isTest
public class ApexP0ExercisesTest {
    @TestSetup
    static void mockData(){
        List<Account> newAccounts = TestDataFactory.createAccounts(10, 500, 'testSmallAccount');
        newAccounts.addAll(TestDataFactory.createAccounts(10, 1500, 'testMediumAccount'));
        newAccounts.addAll(TestDataFactory.createAccounts(10, 15000, 'testLargeAccount'));
        Date testCloseDate = Date.newInstance(2011, 1, 1);
        List<Lead> newLeads = TestDataFactory.createLead(10, 'testLead');
        List<Opportunity> newOpps = TestDataFactory.createOpportunity(10, testCloseDate, 'testOpp');
    }
    
    //Test.startTest();
    //Test.stopTest();
    @isTest
    static void nFibonacciTest(){
        Integer fib1 = ApexP0Exercises.nFibonacci(0);
        Integer fib2 = ApexP0Exercises.nFibonacci(1);
        Integer fib3 = ApexP0Exercises.nFibonacci(2);
        Integer fib4 = ApexP0Exercises.nFibonacci(10);
        System.assertEquals(0, fib1); 
        System.assertEquals(1, fib2); 
        System.assertEquals(1, fib3); 
        System.assertEquals(55, fib4); 
    }
    
    @isTest
    static void sortArrayTest(){
        Integer[] sort1 = ApexP0Exercises.sortArray(new integer[]{2,4,5,1,3,1});
        Integer[] sort2 = ApexP0Exercises.sortArray(new integer[]{5,4,3,2,1});
        System.assertEquals(new integer[]{1,1,2,3,4,5}, sort1);
        System.assertEquals(new integer[]{1,2,3,4,5}, sort2);
    }
    
    @isTest
    static void nFactorialTest(){
        Integer fac1 = ApexP0Exercises.nFactorial(0);
        Integer fac2 = ApexP0Exercises.nFactorial(1);
        Integer fac3 = ApexP0Exercises.nFactorial(3);
        System.assertEquals(1, fac1);
        System.assertEquals(1, fac2);
        System.assertEquals(6, fac3);
    }
    
    @isTest
    static void rotateLeftNTimesTest(){
        Integer[] rot1 = ApexP0Exercises.rotateLeftNTimes(new integer[]{1,2,3,4,5}, 1);
        Integer[] rot2 = ApexP0Exercises.rotateLeftNTimes(new integer[]{1,2,3,4,5}, 6);
        Integer[] rot3 = ApexP0Exercises.rotateLeftNTimes(new integer[]{1,2,3,4,5}, 3);
        System.assertEquals(new integer[]{2,3,4,5,1}, rot1);
        System.assertEquals(new integer[]{2,3,4,5,1}, rot2);
        System.assertEquals(new integer[]{4,5,1,2,3}, rot3);
    }
    
    @isTest
    static void bracketsAreBalancedTest(){
        Boolean bal1 = ApexP0Exercises.bracketsAreBalanced('( )');
        Boolean bal2 = ApexP0Exercises.bracketsAreBalanced('( ) ( )');
        Boolean bal3 = ApexP0Exercises.bracketsAreBalanced('( ( ) )');
        Boolean bal4 = ApexP0Exercises.bracketsAreBalanced('( { [ ] } )');
        Boolean notBal1 = ApexP0Exercises.bracketsAreBalanced('(');
        Boolean notBal2 = ApexP0Exercises.bracketsAreBalanced(')');
        Boolean notBal3 = ApexP0Exercises.bracketsAreBalanced('( ( )');
        Boolean notBal4 = ApexP0Exercises.bracketsAreBalanced('( [ ) ]');
        System.assertEquals(true, bal1);
        System.assertEquals(true, bal2);
        System.assertEquals(true, bal3);
        System.assertEquals(true, bal4);
        System.assertEquals(false, notBal1);
        System.assertEquals(false, notBal2);
        System.assertEquals(false, notBal3);
        System.assertEquals(false, notBal4);
    }
    
    @isTest
    static void updateAccountSizeTest(){
        Test.startTest();
        ApexP0Exercises.updateAccountSize();
        test.stoptest();
        List<Account> accList1 = [SELECT Size__c FROM Account WHERE Name = 'testSmallAccount'];
        List<Account> accList2 = [SELECT Size__c FROM Account WHERE Name = 'testMediumAccount'];
        List<Account> accList3 = [SELECT Size__c FROM Account WHERE Name = 'testLargeAccount'];
        for(Account a: accList1){
            System.assertEquals('small', a.Size__c);
        }
        for(Account a: accList2){
            System.assertEquals('medium', a.Size__c);
        }
        for(Account a: accList3){
            System.assertEquals('large', a.Size__c);
        }
    }
    
    @isTest
    static void updateCALeadsTest(){
        Test.startTest();
        ApexP0Exercises.updateCALeads();
        test.stoptest();
        List<Lead> leadList = [SELECT status, description FROM Lead WHERE state = 'CA'];
        for(Lead l: leadList){
            System.assertEquals('Closed - Not Converted', l.status);
            System.assertEquals('We are no longer doing business in California.', l.description);
        }
    }
    
    @isTest
    static void closePastDueOpportunitiesTest(){
        Test.startTest();
        ApexP0Exercises.closePastDueOpportunities();
        test.stoptest();
        List<Opportunity> oppList = [SELECT StageName FROM Opportunity WHERE CloseDate < today];
        for(Opportunity o: oppList){
            System.assertEquals('Closed Lost', o.StageName);
        }
    }
    
}