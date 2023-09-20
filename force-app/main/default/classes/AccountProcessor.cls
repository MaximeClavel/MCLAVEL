public class AccountProcessor {

    @future
    static public void countContacts (List<ID> listOfIdsAccount)
    {
        List<AggregateResult> AggregateResultList = [SELECT accountId, COUNT(ID)nbid FROM Contact WHERE AccountId IN:listOfIdsAccount GROUP BY AccountId];
        
        Map<Id,Integer> myMap = new Map<Id,Integer>();
        
        for(AggregateResult aggr : AggregateResultList)
        {
            myMap.put((id)aggr.get('accountId'),(integer)aggr.get('nbid'));
        }
        
        List<Account> myListAccToUpdate = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN:myMap.keyset()];
        
        for(Account acc : myListAccToUpdate)
        {
            acc.Number_of_Contacts__c = myMap.get(acc.Id);
        }
        
        update myListAccToUpdate;
    }
}