global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    	
        // instance member to retain state across transactions
    	global Integer recordsProcessed = 0;
        
    	global Database.QueryLocator start(Database.BatchableContext bc) {
        	system.debug('£££ MCLA -START- counter request : '+[select count() FROM lead]);
            system.debug('£££ MCLA -START- request : '+[select Id, lastName, LeadSource FROM lead]);
            return Database.getQueryLocator(
                'SELECT ID, LeadSource FROM Lead'
        	);
            
        }
    
    	global void execute(Database.BatchableContext bc, List<Lead> scope) {
            
            For(Lead mylead : scope)
            {
                mylead.LeadSource = 'Dreamforce';
                recordsProcessed ++;
            }
			update scope;   
            
        }
    
    	 global void finish(Database.BatchableContext bc) {
         	
             System.debug(recordsProcessed + ' records processed. Shazam!');
         }
    
    
    
    }