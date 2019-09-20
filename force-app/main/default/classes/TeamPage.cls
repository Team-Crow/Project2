public class TeamPage {
	public List<Player__c> players { get; set; }
    public Team__c team { get; set; }
    public TeamPage(){
        team = getTeam();
        players = getplayer();
    }
    
    Player__c player =[SELECT Name, User__c, Team__c FROM PLayer__c WHERE User__c = :UserInfo.getUserID() LIMIT 1];
    
    public List<Player__c> getplayer() {
   		List<Player__c> p=[SELECT Name, User__c, Team__c, Points__c, Rank__c FROM PLayer__c WHERE Team__c = :player.Team__c ORDER BY Points__c DESC];
        return p;
    }
    
    public Team__c getTeam() {
        Team__c t=[SELECT Id, Name, Team_Rank__c, Team_Score__c
                           FROM Team__c WHERE Id = :player.Team__c];
        return t;
    } 
}