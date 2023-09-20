@isTest
global class AccountManagerMock implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"ACCOUNT" : {"ID" : "0011t000005A1zKAAS","NAME" : "United Oil & Gas Corp."},"CONTACT" : [ {"ID" : "0031t000004ixk5AAA","NAME" : "Arthur Song"}, {"ID" : "0031t000004ixkAAAQ","NAME" : "Avi Green"}, {"ID" : "0031t000004ixk0AAA","NAME" : "Stella Pavlova"}, {"ID" : "0031t000004ixk1AAA","NAME" : "Lauren Boyle"} ]}');
        response.setStatusCode(200);
        return response; 
    }
}