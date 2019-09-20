({
	createAccount : function(component, event, helper) {
		let newAccount = component.get('v.newAccount');
        let saveAccount = component.get('c.saveAccount');
        
        saveAccount.setParams({
            "acc":newAccount
        });
        
        saveAccount.setCallback(this, function(response){
            /*
            if(response.getState()==="SUCCESS"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({"title":"Success!","message":"The account was saved!", "type":"success"});
                toastEvent.fire();
            }else if (response.getState()==="ERROR"){
                console.error("error.");
            }*/
        });
                                
            
        $A.enqueueAction(saveAccount);
	}
})