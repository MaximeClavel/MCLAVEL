@isTest
global class ParkServiceMock implements WebServiceMock {
	
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) 
    {
    	ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        String ham = 'Hamburg Wadden Sea National Park';
        String hai = 'Hainich National Park';
        String bav = 'Bavarian Forest National Park';
        List<String> myList = new List<String>();
        myList.add(ham);
        myList.add(hai);
        myList.add(bav);
        
        response_x.return_x = myList;
        response.put('response_x', response_x);
    }
}