@isTest
public class AccountUtilsTest {
    @testSetup
    static void testSetup() {
        // Create test data
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            accounts.add(new Account(Name='Test Account ' + i, BillingState='California'));
        }
        insert accounts;
    }

    @isTest
    static void testAccountsByState() {
        // Test data
        String state = 'California';
        List<Account> expectedAccounts = [SELECT Id, Name FROM Account WHERE BillingState = :state WITH USER_MODE];

        // Test
        List<Account> accounts = AccountUtils.accountsByState(state);

        // Assert
        System.assertEquals(expectedAccounts, accounts,'Expecting same account, here there are not.');
    }
}