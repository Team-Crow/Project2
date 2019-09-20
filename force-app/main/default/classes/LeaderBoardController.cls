public class LeaderBoardController {
    //list to obtain players
    public List<Player__c> players{get;set;}
    
       //constructor Querying players in database
    public LeaderBoardController() {
        players = [SELECT Name, Rank__c, Points__c, Team__r.Name FROM Player__c ORDER BY Rank__c ASC LIMIT 10];
        
    }
    
    // attempt list 
    public List<Attempt__c> attempt = new List<Attempt__c>();
    public List<Attempt__c> getattempt() {
   		List<Attempt__c> a=[SELECT id, Name, Score__c, Player__r.User__c
                            FROM Attempt__c 
                            WHERE Player__r.User__c =: UserInfo.getUserId() ORDER BY Name DESC LIMIT 5];
        return a;
    }
    
    //----- Personal stats ---
    public List<Player__c> player = new List<Player__c>();
    public List<Player__c> getplayer() {
   		List<Player__c> p=[SELECT Name, User__c, Team__c, Points__c, Rank__c, Quiz_Taken__c, Quiz_Average__c 
                           FROM PLayer__c WHERE User__c = :UserInfo.getUserID() ORDER BY Rank__c ASC];
        return p;
    }
    
    //-----Team leaderBoard ----
    public List<Team__c> team = new List<Team__c>();
    public list<Team__c> getteam(){
        	List<Team__c> t = [SELECT Name, Team_Rank__c, Team_Score__c FROM Team__c ORDER BY Team_Rank__c ASC];
        return t;
    }
    
  
         
  }