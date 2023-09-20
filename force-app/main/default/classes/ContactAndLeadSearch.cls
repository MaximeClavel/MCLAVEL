public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(string P_Name)
    {
        return [FIND :P_Name IN ALL FIELDS RETURNING contact(lastname), lead(LastName)];
    }
}