trigger AccountAddressTrigger on Account (before insert, before update) {
	for(Account acc: Trigger.new)
    {
        if(Acc.BillingPostalCode <> null && Acc.Match_Billing_Address__c)
    	{
    	    Acc.ShippingPostalCode = Acc.BillingPostalCode;
    	}
    }
    	
}