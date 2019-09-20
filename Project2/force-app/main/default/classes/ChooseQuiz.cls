public with sharing class ChooseQuiz {
    public Attempt__c NewAttempt { get; set; }
    public Player__c player {get;set;}
    public ChooseQuiz(){
        player=getplayer();
        Id id = ApexPages.currentPage().getParameters().get('id');
        NewAttempt = (id == null) ? new Attempt__c() :
            [SELECT Name, Player__c, Quiz__c FROM Attempt__c WHERE Id = :id];
		
    }
       
    public Player__c getplayer() {
   		Player__c p=[SELECT Id, Name, User__c FROM PLayer__c WHERE User__c = :UserInfo.getUserID()];
        return p;
    }
    
    public pagereference SaveAttempt(){
        NewAttempt.Player__c = player.Id;
        insert NewAttempt;
        PageReference Page = new PageReference('/apex/QuizPage2');
    	Page.setRedirect(true);
    	return Page;
    }
    
}

//Old
/*
public class ChooseQuiz {
    apexpages.StandardController stdController;
    public ChooseQuiz(ApexPages.StandardController stdController){
        this.stdController = stdController;
    }
    
    public pagereference SaveAttempt(){
        stdController.save();
        PageReference Page = new PageReference('/apex/QuizPage');
    	Page.setRedirect(true);
    	return Page;
    }
    
}
*/