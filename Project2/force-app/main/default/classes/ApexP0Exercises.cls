public class ApexP0Exercises {
	
    //system.debug(ApexP0Exercises.nFibonacci(10));
    public static Integer nFibonacci( Integer n ){
        if(n <= 1){
            return n;
        }
        return nFibonacci(n - 1) + nFibonacci(n - 2);
    }
    
    //integer[] a = new integer[]{2,4,5,1,3,1};
	//system.debug(ApexP0Exercises.sortArray(a));
    public static Integer[] sortArray( Integer[] intList ) {
        //integer[] intArray = new integer[]{2,5,3,1} ; 
        integer temp;
            for(integer i = 1; i < intList.size(); i++){
                for(integer j = i; j > 0; j--){
                    if(intList[j] < intList[j - 1]){
                        temp = intList[j];
                    	intList[j] = intList[j - 1];
                    	intList[j - 1] = temp;
                    }
                }
            }
        return intList;
    }
    
    //system.debug(ApexP0Exercises.nFactorial(3));
    public static Integer nFactorial( Integer n) {
        integer factorial = 1;
        for(integer i = 1; i <= n; i++){
            factorial = factorial*i;
            system.debug(i);
        }
        return factorial;
    }
	
	//integer[] a = new integer[] {1,2,3,4,5};
	//system.debug(ApexP0Exercises.rotateLeftNTimes(a,6));    
    public static integer[] rotateLeftNTimes(integer[] intArray, integer n){
        integer temp;
        for(integer i = 0; i < n; i++){
            temp = intArray[0];
            for(integer j = 0; j < intArray.size() - 1;j++){
                intArray[j] = intArray[j + 1];
            }
            intArray[intArray.size() - 1] = temp;
        }
        return intArray;
    }
    
    //String s = '()()';
	//system.debug(ApexP0Exercises.bracketsAreBalanced(s));	
    public static Boolean bracketsAreBalanced( String s ) {
        List <String> newS = s.split('');
        List <String> temp = new List<String>(); 
        for(integer i = 0; i < newS.size(); i++){
            if(newS[i].equals('{') || newS[i].equals('[') || newS[i].equals('(') ){
            	temp.add(newS[i]);
        	}else if(newS[i].equals('}')){
                if(temp.isEmpty()){
                    return false;
                }else if(temp[temp.size() - 1].equals('{')){
                    temp.remove(temp.size()-1);
                }else if(!temp[temp.size() - 1].equals('{') || temp.isEmpty()){
                    return false;
                }
            }else if(newS[i].equals(']')){
                if(temp.isEmpty()){
                    return false;
                }else if(temp[temp.size() - 1].equals('[')){
                    temp.remove(temp.size()-1);
                }else if(!temp[temp.size() - 1].equals('[') || temp.isEmpty()){
                    return false;
                }
            }else if(newS[i].equals(')')){
                if(temp.isEmpty()){
                    return false;
                }else if(temp[temp.size() - 1].equals('(')){
                    temp.remove(temp.size()-1);
                }else if(!temp[temp.size() - 1].equals('(') || temp.isEmpty()){
                    return false;
                }
            }
        }
        return temp.isEmpty();
    }
    
    //ApexP0Exercises.updateAccountSize();
    public static void updateAccountSize( ) {
        List<Account>accountList = [select Name, NumberofEmployees, Size__c from Account where NumberofEmployees != null];
        for(Account a: accountList){
            if(a.NumberOfEmployees > 0 && a.NumberOfEmployees <= 1000){
                a.Size__c = 'small';
            }else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees <= 10000){
                a.Size__c = 'medium';
            }else if(a.NumberOfEmployees > 10000){
                a.Size__c = 'large';
            }
        }
        database.update(accountList);
	}
    
    //ApexP0Exercises.updateCALeads();
    //select name, state, status, description from Lead where state != null
    public static void updateCALeads( ) {
        List<Lead> leadList = [select name, state, status, description from Lead where state = 'CA'];
        for(Lead l: leadList){
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
        }
        database.update(leadList);
	}
    
    //ApexP0Exercises.closePastDueOpportunities();
    //select Name, CloseDate, StageName from Opportunity
    public static void closePastDueOpportunities( ) {
        List<Opportunity>opportunityList = [select Name, CloseDate, StageName from Opportunity where (CloseDate < today AND  StageName != 'Closed Won')];
        for(Opportunity o: opportunityList){
            o.StageName = 'Closed Lost';
        }
        database.update(opportunityList);
	}
    
}