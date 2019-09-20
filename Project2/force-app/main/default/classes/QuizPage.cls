public with sharing class QuizPage {
    public string radiovalue {set;get;}
	public Integer rec { get; set; }
    public Integer tot { get; set; }
   	integer totalRecs = 0;
   	integer count= 0;
   	integer LimitSize= 1;
	
    /*
    public PageReference Move()
    {
    PageReference Page = new PageReference('/apex/PlayerPage');
    Page.setRedirect(true);
    return Page;
    }*/
    

	public QuizPage(){
    	tot=totalRecs = [select count() from Question__c];
    }
    
    public List<Quiz__c> Math = [SELECT Id FROM Quiz__c WHERE Category__c = 'Math'];
    public Id playerId=[SELECT Name, User__c FROM PLayer__c WHERE User__c = :UserInfo.getUserID()].Id;
    public Attempt__c attempt = new Attempt__c (Player__c = playerId);
    public Answer__c answer;
    
    
    
    public List<Question__c> questions=new List<Question__c>();
   	public List<Question__c> getQuestions() {
   		List<Question__c> q=[select Name, Question__c, A__c, B__c, C__c, D__c, Quiz__c from Question__c WHERE Quiz__c IN : Math ORDER BY Name LIMIT:limitsize OFFSET:count];
        return q;
    }
    
    public void Submit()
    {
        //implement your logic
    }
    
    public void updatePage() {
        questions.clear();
        limitsize=rec;
        questions=[select Name, Question__c, A__c, B__c, C__c, D__c, Quiz__c from Question__c WHERE Quiz__c IN : Math ORDER BY Name LIMIT:limitsize OFFSET:count];
    }
    
    public PageReference prvbtn() {
    	count=count-limitsize;
        return null;
    }

    public PageReference Nxtbtn() {
 		count=count+limitsize;
        return null;
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