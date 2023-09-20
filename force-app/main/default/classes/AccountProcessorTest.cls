@isTest
public class AccountProcessorTest {
	
    @isTest
    static public void testFuture ()
    {
        Test.startTest();
        //creation of account
        Account acc1 = new Account(Name='My acc Test 1');
       	Account acc2 = new Account(Name='My acc Test 2'); 
        
        insert (new List<Account>{acc1,acc2});
        
        Contact cct1 = new Contact(lastName='My Contact 1',accountId=acc1.Id);
        Contact cct2 = new Contact(lastName='My Contact 2',accountId=acc2.Id);
        Contact cct3 = new Contact(lastName='My Contact 3',accountId=acc2.Id);
        
        insert (new List<Contact>{cct1,cct2,cct3});
        
        AccountProcessor.countContacts(new List<ID>{acc1.id,acc2.id});
        Test.stopTest();
    }
}