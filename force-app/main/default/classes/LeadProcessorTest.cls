@isTest
private class LeadProcessorTest {
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
    static testmethod void test() {        
        Test.startTest();
        system.debug('£££ MCLA -RUN TEST- counter request : '+[select Id, lastName, LeadSource FROM lead]);
        LeadProcessor myLeadPro = new LeadProcessor();
        Id batchId = Database.executeBatch(myLeadPro);
        Test.stopTest();
        system.debug('£££ MCLA -END TESST- counter request : '+[select Id, lastName, LeadSource FROM lead]);
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() FROM lead where LeadSource = 'Dreamforce']);
    }
    
}