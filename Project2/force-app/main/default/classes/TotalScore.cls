public with sharing class TotalScore {
    
    public List <Attempt__c> attemptList = [SELECT Id, Name, Score__c, Player__r.User__c FROM Attempt__c WHERE Player__r.User__c =: UserInfo.getUserID()];

    public Decimal getTotalScore() {
        
        Decimal quizAverage= 0;

        for(Attempt__c a: attemptList)
        {
            quizAverage = (a.Score__c + quizAverage)/attemptList.Size();
        }
        
        

        return quizAverage;
    }

    public List <Attempt__c> getAttempts()
    {
        return attemptList;
    }
}