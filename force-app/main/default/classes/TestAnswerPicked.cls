@isTest
public class TestAnswerPicked {

    @TestSetup
    public static void makeData(){
        
        MockDataProj2.dataInputQuizQuest();
        MockDataProj2.dataInputPlayerTeam();
        MockDataProj2.dataInputAttempAns();
        

        
    }
    
    @isTest
    public static void TestUpdateQuestionA() {


        Test.startTest();
        AnswerPickedTriggerHandler.updateQuestion();
        Test.stopTest();

        Quiz__c quiz = [SELECT id,Name FROM Quiz__c WHERE Name = 'Math 101' LIMIT 1];

        List<Question__c> questionListA = [SELECT Id, A_Picked__c, B_Picked__c,C_Picked__c, D_Picked__c, Passing__c FROM Question__c WHERE  Quiz__c=: quiz.Id];
       
        System.assertEquals(100, questionListA[0].A_Picked__c);

    }

    @isTest
    public static void TestUpdateQuestionC() {

        
        Test.startTest();
        AnswerPickedTriggerHandler.updateQuestion();
        Test.stopTest();

        Quiz__c quiz = [SELECT id,Name FROM Quiz__c WHERE Name = 'Math 101' LIMIT 1];

        List<Question__c> questionListA = [SELECT Id, A_Picked__c, B_Picked__c,C_Picked__c, D_Picked__c, Passing__c FROM Question__c WHERE  Quiz__c=: quiz.Id];

        System.assertEquals(0, questionListA[0].C_Picked__c);

    }    
    
    @isTest
    public static void TestUpdateQuestionB() {
        
        
        Test.startTest();
        AnswerPickedTriggerHandler.updateQuestion();
        Test.stopTest();

             Quiz__c quiz = [SELECT id,Name FROM Quiz__c WHERE Name = 'Math 101' LIMIT 1];

        List<Question__c> questionListA = [SELECT Id, A_Picked__c, B_Picked__c,C_Picked__c, D_Picked__c, Passing__c FROM Question__c WHERE  Quiz__c=: quiz.Id];

        System.assertEquals(0, questionListA[0].B_Picked__c);

    }    
    
    @isTest
    public static void TestUpdateQuestionD() {

       
        Test.startTest();
        AnswerPickedTriggerHandler.updateQuestion();
        Test.stopTest();

         Quiz__c quiz = [SELECT id,Name FROM Quiz__c WHERE Name = 'Math 101' LIMIT 1];

        List<Question__c> questionListA = [SELECT Id, A_Picked__c, B_Picked__c,C_Picked__c, D_Picked__c, Passing__c FROM Question__c WHERE  Quiz__c=: quiz.Id];

        System.assertEquals(0, questionListA[0].D_Picked__c);

    }    
}