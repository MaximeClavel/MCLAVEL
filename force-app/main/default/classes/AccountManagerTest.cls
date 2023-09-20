@IsTest
private class AccountManagerTest {
	
    @isTest 
    static void testgetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Cases/'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(
            Name='Test record');
        insert accountTest;
        return accountTest.Id;
    }          

    /*
    
    @isTest 
    static void testGetAccountJSONById() {
    	        
        Id recordId = createTestRecord();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AccountManagerMock());
        
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://eu16.salesforce.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        system.debug('£££ MCLA - RestContext.response : '+ RestContext.response);
        // Call the method to test
        AccountManager.getAccount_JSON();
        
    }
    
    // Helper Account method
    /*static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(Name='ACC TEST1');
        insert accTest;
        		
        // Create test record
        Contact ccTest1 = new Contact(LastName='CONTACT TEST 1', accountId=accTest.id);
        Contact ccTest2 = new Contact(LastName='CONTACT TEST 2', accountId=accTest.id);
        Contact ccTest3 = new Contact(LastName='CONTACT TEST 3', accountId=accTest.id);
        List<Contact> myList = new List<Contact>();
        myList.add(ccTest1);
        myList.add(ccTest2);
        myList.add(ccTest3);
        
        insert myList;
        
        return accTest.Id;
    
    }*/
    
}