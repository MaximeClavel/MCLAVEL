public with sharing class AccountUtils {
    
    public static List<Account> accountsByState(String state) {
        List<Account> accounts = new List<Account>();
        if (String.isNotBlank(state)) {
            for (Account acc : [SELECT Id, Name FROM Account WHERE BillingState = :state]) {
                accounts.add(acc);
            }
        }
        return accounts;
    }

}

            