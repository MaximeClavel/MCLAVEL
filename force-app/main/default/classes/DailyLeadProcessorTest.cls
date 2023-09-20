@isTest
private class DailyLeadProcessorTest {
	
    public static String CRON_EXP = '17 50 0 21 10 ? 2029';
    
    @testSetup 
    static void setup() {
        List<Lead> leadToCreate = new List<Lead>();
        
        for (Integer i=0; i<200; i++) 
        {
            Lead monLead = new Lead(
                lastName = 'Lead ' + i,
                Company = 'Company',
                Status = 'Prospecting'
            );
           leadToCreate.add(monLead);
        }
        insert leadToCreate;
    }
    
    static testmethod void testScheduledJob() 
    {
       	Test.startTest();
        system.debug('£££ MCLA -RUN TEST- counter lead : '+[select count() FROM lead]);
        
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        
        Test.stopTest();
        
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() FROM lead where LeadSource = 'Dreamforce']);
        
        
    }
}