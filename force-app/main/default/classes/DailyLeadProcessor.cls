global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leadToUpdate = [SELECT Id
            FROM Lead 
            WHERE LeadSource = ''
            LIMIT 200];
        
        for(Lead myLead : leadToUpdate)
        {
            myLead.LeadSource = 'Dreamforce';
        }
        
        update leadToUpdate;
    }
    
    
}