public with sharing class QuizPage {
    public list<Answer__c> questions {get;set;}
	public Integer rec { get; set; }
    public Integer tot { get; set; }
   	integer totalRecs = 0;
   	integer count= 0;
   	integer LimitSize= 1;
    
    List<Player__c> p=[SELECT Name, User__c FROM PLayer__c WHERE User__c = :UserInfo.getUserID()];
    public List<Attempt__c> attempt = [SELECT Id FROM Attempt__c WHERE Player__c =: p[0].Id ORDER BY LastModifiedDate DESC LIMIT 1];
    //public List<Answer__c> questions=new List<Answer__c>();
   	public List<Answer__c> getQuestions() {
   		List<Answer__c> q=[select Name, Question__c, A__c, B__c, C__c, D__c, Choice__c from Answer__c WHERE Attempt__c IN : attempt ORDER BY Name LIMIT:limitsize OFFSET:count];
        return q;
    }
    
    public QuizPage(){
    	tot=totalRecs = [select count() from Answer__c WHERE Attempt__c IN : attempt];
        //questions = [select Name, Question__c, A__c, B__c, C__c, D__c, Choice__c from Answer__c WHERE Attempt__c IN : attempt ORDER BY Name LIMIT:limitsize OFFSET:count];
        questions = getQuestions();
    }
        
    public void updatePage() {
        questions.clear();
        limitsize=rec;
        questions=[select Name, Question__c, A__c, B__c, C__c, D__c, Choice__c from Answer__c WHERE Attempt__c IN : attempt ORDER BY Name LIMIT:limitsize OFFSET:count];
    }
    
    public PageReference ChooseA() {
        for(Answer__c a: questions){
            a.Choice__c = 'A';
        }
        update questions;
        return null;
    }
    
    public PageReference ChooseB() {
        for(Answer__c a: questions){
            a.Choice__c = 'B';
        }
        update questions;
        return null;
    }
    
    public PageReference ChooseC() {
        for(Answer__c a: questions){
            a.Choice__c = 'C';
        }
        update questions;
        return null;
    }
    
    public PageReference ChooseD() {
        for(Answer__c a: questions){
            a.Choice__c = 'D';
        }
        update questions;
        return null;
    }
    
    public PageReference save() {
        try {
            update questions;
        } catch(system.DmlException e) {
            Apexpages.AddMessages(e);
            return null;
        }

        return null;
    }
    
    public PageReference prvbtn() {
    	count=count-limitsize;
        updatePage();
        return null;
    }

 	public PageReference Nxtbtn() {
 		count=count+limitsize;
        updatePage();
        return null;
    }
    
    public pagereference Submit(){
        PageReference Page = new PageReference('https://players-developer-edition.na136.force.com/s/');
    	Page.setRedirect(true);
    	return Page;
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