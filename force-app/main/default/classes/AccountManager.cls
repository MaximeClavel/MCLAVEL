//@RestResource(urlMapping='/Accounts/*/contacts')
@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    
    //private static JSONGenerator jsonSOD{get;set;}
    
    @HttpGet
    global static Account getAccount() {
        system.debug('£££ MCLA - GETACCOUNT() - START');
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String OwnerId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT Id, Name, (SELECT ID, Name FROM Contacts)
                        FROM Account
                        ][0];
        system.debug('£££ MCLA - result Account&Cct : ' + result);
        
        system.debug('£££ MCLA - GETACCOUNT() - END');
        return result;
    }

    /*
    //@HttpGet
    global static void getAccount_JSON() 
    {
        RestRequest request = RestContext.request;
        if(RestContext.response == null)
        {
            RestResponse res = new RestResponse();
        	RestContext.response = res;
        }
        
        // grab the caseId from the end of the URL
        //String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        String accountId = request.requestURI.substring(request.requestURI.indexOf('/Accounts/')+10,request.requestURI.indexOf('/contacts'));
        
        System.debug('£££ MCLA - accountID : ' + accountId);
        System.debug('£££ MCLA - RestContext.request : '+ RestContext.request);
        System.debug('£££ MCLA - RestContext.response : '+ RestContext.response);
        
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(accountContact(accountId));
        
        //return Blob.valueOf(accountContact(accountId));
    }
    
    //Method who can get contacts of the account
    private static String accountContact (String monId)
    {
        jsonSOD = JSON.createGenerator(true);
        jsonSOD.writeStartObject();
        /**************************************************ACCOUNT**************************************************/
        /*jsonSOD.writeFieldName('ACCOUNT');
        jsonSOD.writeStartObject();
        
        Account result =  [SELECT Id, Name
                        FROM Account
                        WHERE Id = :monId];
        
        writeStringFieldToJSON('ID', String.valueOf(result.Id));
        writeStringFieldToJSON('NAME', String.valueOf(result.Name));
        jsonSOD.writeEndObject();*/
        /***********************************************************************************************************/
        
        /**************************************************CONTACT**************************************************/
        /*jsonSOD.writeFieldName('CONTACT');
        jsonSOD.writeStartArray();
        
        List<Contact> resultsCc = [SELECT Id, Name FROM Contact WHERE AccountId = :monId];
        
        for (Contact cct : resultsCc)
        {
            jsonSOD.writeStartObject();
            
            writeStringFieldToJSON('ID', String.valueOf(cct.Id));
        	writeStringFieldToJSON('NAME', String.valueOf(cct.Name));	
            
            jsonSOD.writeEndObject();
        }
        jsonSOD.writeEndArray(); */
        /***********************************************************************************************************/
        /*
        jsonSOD.writeEndObject();
        return jsonSOD.getAsString();
    }
    */
   	/**
     * @author  : KBEL
     * @description : check field value and add json null or string value
     * @param : json field name, json field value
     * @return : 
     */
   /* private static void writeStringFieldToJSON(String fieldName, String fieldValue){
        if (fieldValue==null){
              jsonSOD.writeNullField(fieldName);
        }else{
            jsonSOD.writeStringField(fieldName, fieldValue);
        }        
    }
*/
}