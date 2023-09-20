public class AccountHandler 
{
	public static account insertNewAccount(String P_AccountName)
    {
        Account MyAccount;
        try
        {
            MyAccount = new Account(Name=P_AccountName);
        	insert MyAccount;
        }
        catch (DmlException e)
        {
            return null;
        }
        
        return MyAccount;
    }
    
}