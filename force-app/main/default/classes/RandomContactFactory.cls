public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer pNbCct, String pLastName)
    {
        List<Contact> myListCct = new List<Contact>();
        
        for(integer i=0;i<pNbCct;i++)
        {
            String sonString = 'Test '+i;
            Contact myContact = new Contact(lastName=pLastName,firstName=sonString);
            myListCct.add(myContact);
        }
        
        return myListCct;
    }
    
}