@isTest
private class ParkLocatorTest {
	@isTest 
    static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String myCountry = 'Germany';
        List<String> result = ParkLocator.country(myCountry);
        
        // Verify that a fake result is returned
        String ham = 'Hamburg Wadden Sea National Park';
        String hai = 'Hainich National Park';
        String bav = 'Bavarian Forest National Park';
        List<String> myList = new List<String>();
        myList.add(ham);
        myList.add(hai);
        myList.add(bav);
        
        System.assertEquals(myList, result); 
    }
}