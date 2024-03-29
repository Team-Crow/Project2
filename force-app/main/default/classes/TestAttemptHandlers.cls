@isTest
public class TestAttemptHandlers {
	
    //Calls the mockData class to setup records Quiz and Player
    @TestSetup
    static void setupData()
    {
        MockDataProj2.dataInputQuizQuest();
        MockDataProj2.dataInputPlayerTeam();

     }
    
    //Test to see if 5 answers are created automatically when an attempt is created
    @isTest
    static void checkIfAnswersAreCreatedForAttempt()
    {
        //MockDataProj2.dataInputAttempAns();
        list<Attempt__c> nAttempt = new list<Attempt__c>();
        
        //querying the quiz and player to add into attempt
        list<Quiz__c> queryQuiz2 = [Select id, Name From Quiz__c];
        list<Player__c> queryPlayer2 = [Select id, Name From Player__c];
        
            //inserting attempts
            for(Player__c loopingPlayer: queryPlayer2) {
                for(Quiz__c loopingQuiz: queryQuiz2) {
                    nAttempt.add(new Attempt__c(Quiz__c=loopingQuiz.Id, Player__c=loopingPlayer.id));
                }
            }
            
        	//Records are being inserted into the database
            Test.startTest();
            	database.insert(nAttempt);
			Test.stopTest();
			
        	//checks if 5 answers where created for each attempt
        	nAttempt = [SELECT Id, Answers__c FROM Attempt__c WHERE Answers__c !=5];
        
            System.assertEquals( 0, nAttempt.Size());
        
    }
    
    //Checked to see if the points and average score was update
    @isTest
    static void checkPointsAreupdatedForPlayer()
    {
        	//
         	MockDataProj2.dataInputAttempAns();
        	

        	list<Answer__c> answerList = [SELECT Id, Choice__c,Correct_Answer__c FROM Answer__c];
        	
        	list<Answer__c> answerUpdateList = New list <Answer__c>();
        
        	for(Answer__c a:answerList)
            {
                a.Choice__c = a.Correct_Answer__c;
                answerUpdateList.add(a);
            }
           
        	Test.startTest();
        		update answerUpdateList;
            Test.stopTest();
        
			list<Player__c> playerList = [SELECT Id, Name, Points__c, Quiz_Average__c,Quiz_Taken__c,Rank__c FROM Player__c];
			
        	boolean points = True;
			
        	for(Player__c p:playerList)
            {
                if(p.Points__c != 200 && p.Quiz_Average__c != 100)
                {
                    points = False;
                }
            }
        	
        	System.assertEquals( True, points);
    }
		    
    
}