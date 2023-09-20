public class AnimalLocator {

    public static String getAnimalNameById (Integer myID)
    {
        String nameAnimal='';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + myID);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        Map<String, Object> animal;
        //String name = 'name';
        if (response.getStatusCode() == 200) 
        {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            animal = (Map<String, Object>) results.get('animal');
            System.debug('Received the following animal:');
            System.debug(animal);
            System.debug(animal.get('name'));
            nameAnimal = (String) animal.get('name');
        }
        
        return nameAnimal;
    }
}