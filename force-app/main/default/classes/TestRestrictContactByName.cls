@isTest
public class TestRestrictContactByName {

    @isTest
    static void testTrigger ()
    {
        try
        {
            Contact monCct = new Contact(Lastname='INVALIDNAME');
        	insert monCct;
            
        }catch(Exception e)
        {
            System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',e.getDmlMessage(0));
        }
        
    }
}