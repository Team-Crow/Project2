public with sharing class IntroductionToApex {
    // without sharing
    // inherited sharing
////////////////////////////////////////////
//
//	IntroductionToApex
//	Created on: 8/20/19
//	Author: Frank Yang
//	Description: Simple class to 
//		output 'Hello World' as a system 
//		debug line as an example of apex code.
//
////////////////////////////////////////////
	// We be creatin' variables, arrg! also we a re now pirates.
	private String helloWorld = 'Salesforce';
    private Villains bob;
    
    //Collections
    //List - we delcare this is a list of strings called helloList,
    //and we assign it a value to start.
    private List<String> helloList = new List<String>{'Konnichiwa'};
        
    //Set - we delcare this is a set of Strings called helloSet,
    //and we assign it a value to start.
    private Set<String> helloSet = new Set<String>{'Japan'};
        
    //Map - we delcare a map of string key value pairs,
    //and assign it values to start.
    private Map<String, String> helloMap = new Map<String, String>{'Japan' => 'Konnichiwa'};
        
    //Enums
        public enum Villains {MASTERMIND, BRUISER, HACKER, NUTJOB, DENON, BETRAYER, MINION, THEBOSS}
    
	// Default constructor
	// This constructor takes no arguments, and creates a system.debug
	// output of 'hello world' in the log.
    public IntroductionToApex(){
        //This generate a line in the debug of 'hello world'.
        system.debug('Hello World');
        system.debug('Hello ' + helloWorld);
        
        //Villain Set
        bob = Villains.MINION;
        
        
        //We add two new vlaues to our list
        helloList.add('Bonjour');
        helloList.add('Hola');
        
        //We add two new values to the set
        helloSet.add('France');
        helloSet.add('Spain');
        
        //We add two new key value pairs to our map
        helloMap.put('France', 'Bonjour');
        helloMap.put('Spain', 'Hola');
    }
    
    //Constructor that takes an argument
    public IntroductionToApex(String variableString){
        system.debug('Hello ' + variableString);
    }
    
    public void setHello(String s){
        helloWorld = s;
    }
    
    //Getter
    public String getHello(){
        system.debug(helloWorld);
        return helloWorld;
    }
    
    //Method
    public void sayHello(){
        system.debug('Hello ' + helloWorld);
        system.debug(helloList);
        system.debug(helloSet);
        system.debug(helloMap);
        system.debug('Goodnight Moon');
    }
    
    //Static metho belongs to the class
    static void staticMethod(){
        
    }
    
    //For loop and if else
    public void checkList(String hello){
        for(integer i = 0; i < helloList.size(); i++){
            if(helloList[i] == hello){
                system.debug('we found a match');
            }Else{
                system.debug('No match this time boss!');
            }
        }
    }
    
    //For each instance in the list
    public void checkListForEach(String hello){
        for(String s : helloList){
            if(s == hello){
                system.debug('we found a match');
            }Else{
                system.debug('No match this time boss!');
            }
        }   
    }
    
    public void count(){
        integer i = 0;
        while(i < 5){
            system.debug('The loop goes: ' + i);
            i++;
        }
    }
    
    public void countDo(){
        integer i = 0;
        do{
            system.debug(i);
            i++;
        }while(i < 5);
    }
    
    //Switch
    public void switchMethod(){
        switch on helloWorld{
            when 'Hello'{
                system.debug('Greeting is used in english speaking countries');
            }
            when 'Bonjour'{
                system.debug('Greeting used by french speaking people');
            }
            when 'Konnichiwa'{
                system.debug('Greeting used by weaboos');
            }
            when else{
                    system.debug('I dunno');
            }
        }
    }
    
}