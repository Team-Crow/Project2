public class AnswerPickedTriggerHandler {
    public static void updateQuestion(){
        List<Question__c> questionList = [SELECT Id, Name, A_Picked__c, B_Picked__c, C_Picked__c, D_Picked__c, Passing__c FROM Question__c];
        List<Answer__c> answerList = [SELECT Name, QuestionNumber__c, Choice__c, IsCorrect__c FROM Answer__c];
        for(Integer i = 0; i < questionList.Size(); i ++){
            Decimal Acount = 0, Bcount = 0, Ccount = 0, Dcount = 0, Total = 0, correct = 0, answers = 0;
            for(Answer__c a: answerList){
                if(a.QuestionNumber__c == questionList[i].Id){
                    if(a.IsCorrect__c == true)
                        correct++;
                    if(a.Choice__c == 'A')
                    	Acount++;
                    else if(a.Choice__c == 'B')
                    	Bcount++;
                    else if(a.Choice__c == 'C')
                    	Ccount++;
                    else if(a.Choice__c == 'D')
                    	Dcount++;
                    answers++;
                }
            }
            Total = Acount + Bcount + Ccount + Dcount;
            if(correct == 0)
                questionList[i].Passing__c = 0;
            else
            	questionList[i].Passing__c = (correct/answers)*100;
            If(Total == 0){
                questionList[i].A_Picked__c = 0;
                questionList[i].B_Picked__c = 0;
                questionList[i].C_Picked__c = 0;
                questionList[i].D_Picked__c = 0;
            }else{
            	questionList[i].A_Picked__c = (Acount/Total)*100;
                questionList[i].B_Picked__c = (Bcount/Total)*100;
                questionList[i].C_Picked__c = (Ccount/Total)*100;
                questionList[i].D_Picked__c = (Dcount/Total)*100;   
            }
        }
        update questionList;
    }
}