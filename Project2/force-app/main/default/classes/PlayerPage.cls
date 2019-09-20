public with sharing class PlayerPage {

    public PlayerPage(){
    }
    
    public List<Player__c> players=new List<Player__c>();
    public List<Player__c> getplayers() {
        List<Player__c> p=[SELECT Name, User__c, Team__c, Level__c, Rank__c, Quiz_Taken__c 
                           FROM PLayer__c WHERE User__c = :UserInfo.getUserID()];
        return p;
    }
    
    public void updatePage() {
        players.clear();
        players=[SELECT Name, User__c, Team__c, Level__c, Rank__c, Quiz_Taken__c 
                           FROM PLayer__c WHERE User__c = :UserInfo.getUserID()];
    }
}