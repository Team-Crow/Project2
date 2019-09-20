public class LAC_FormsController {
	@AuraEnabled
    public static void saveAccount(Account acc){
        upsert acc;
    }
}