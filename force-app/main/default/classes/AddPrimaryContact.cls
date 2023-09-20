public class AddPrimaryContact implements Queueable {
	
    private Contact myContact;
    private String stateAbbrev;
    
    public AddPrimaryContact(Contact record, String abbrevState) {
        this.myContact = record;
        this.stateAbbrev = abbrevState;
    }
    public void execute(QueueableContext context) {
        
        List<Contact> cctToInsert = new List<Contact>();
        
        list<account> accs = [SELECT Id FROM Account WHERE BillingState =:this.stateAbbrev LIMIT 200];
        
        this.myContact.AccountId = accs.get(0).Id;
        Contact monCct = this.myContact;
        insert monCct;
        
        accs.remove(0);
        
        system.debug('£££ MCLA - monCct.id : ' + monCct.Id);
        system.debug('£££ MCLA - nb accs : ' + accs.size());
        
        for (Account account : accs) 
        {
           	Contact cctCloneCopy = monCct.clone(false, false, false, false);
           	cctCloneCopy.AccountId = account.Id;
            cctToInsert.add(cctCloneCopy);
        }
        
        insert cctToInsert;
        
        
        
    }
}