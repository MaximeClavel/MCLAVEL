public class ContactSearch {

    public static List<Contact> searchForContacts( string P_LastName, string P_MailingPostalCode)
    {
        return [SELECT Id, Name FROM Contact WHERE LastName = :P_LastName AND MailingPostalCode = :P_MailingPostalCode];
    }
}