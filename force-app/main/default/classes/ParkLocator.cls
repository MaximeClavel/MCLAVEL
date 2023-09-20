public class ParkLocator {

    public static List<String> country (String myName)
    {
        ParkService.ParksImplPort parksImplPort =  new ParkService.ParksImplPort();
        
        return parksImplPort.byCountry(myName);
    }
}