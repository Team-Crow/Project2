public with sharing class PagenationController {
    public Integer rec { get; set; }
    public Integer tot { get; set; }
   	integer totalRecs = 0;
   	integer count= 0;
   	integer LimitSize= 5;

	public PagenationController(){
    	tot=totalRecs = [select count() from account];
    }
    
    public List<Lead> leads=new List<Lead>();
   	public List<Lead> getLeads() {
   		List<Lead> ld=[select Name,Email,Company from Lead LIMIT:limitsize OFFSET:count];
        system.debug('values are:' + ld);
        return ld;
    }
    
    public void updatePage() {
        leads.clear();
        limitsize=rec;
        leads=[select Name,Email,Company from Lead LIMIT:rec OFFSET:count];
    }
    
    public PageReference Firstbtn() {
    	count=0;
        return null;
    }
    
    public PageReference prvbtn() {
    	count=count-limitsize;
        return null;
    }

 	public PageReference Nxtbtn() {
 	count=count+limitsize;
        return null;
    }
    
 	public PageReference lstbtn() {
 		count= totalrecs - math.mod(totalRecs,LimitSize);
        return null;
    }
 
    public Boolean getNxt() {
        if((count+ LimitSize) > totalRecs)
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