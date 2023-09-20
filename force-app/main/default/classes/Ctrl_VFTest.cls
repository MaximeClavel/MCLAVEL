public class Ctrl_VFTest {
    
    public Account demandebureautique {get;set;}
    
	public User selectedUser {get;set;}
    List<SelectOption> maListe {get;set;}
    public String selectedOption {get;set;}
    public Boolean showTaskSectionValue;
    
    public Ctrl_VFTest()
    {
        demandebureautique = new Account(Name='Test');
        showTaskSectionValue = false;
        
        maListe = new List<SelectOption>();
    }
    
    public PageReference actionChange()
    {
        selectedOption = String.valueOf(this.demandebureautique.ownerid);
        selectedOption += 'Coucou';
        
        
        
       	return null; //ApexPages.currentPage();    
    } 
	
    
    public List<SelectOption> getOptions() {
        
        maListe.add(new SelectOption('','-None-'));
        
        if(this.demandebureautique.ownerid != null)
        {
            system.debug('£££ MCLA Demande : ' + this.demandebureautique);
            system.debug('£££ MCLA OwnerID : ' + this.demandebureautique.ownerid);
            
            User monUser = [SELECT Email From User WHERE id=:this.demandebureautique.ownerid];
            
            system.debug('£££ MCLA Email : ' + monUser.Email);
            
            List<Contact> mesContacts = [SELECT Name From Contact WHERE Email=:monUser.Email];
            
            for(Contact monContact : mesContacts)
            {
                maListe.add(new SelectOption(monContact.Name,monContact.Name));
            }
        }
        
        return maListe;
    }
}