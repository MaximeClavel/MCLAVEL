@isTest
private class AnimalLocatorTest {
    @isTest 
    static void testLocatorCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String nameAnimal = AnimalLocator.getAnimalNameById(1);
        String expectedValue = 'chicken';
        System.assertEquals(nameAnimal, expectedValue);
	} 
}