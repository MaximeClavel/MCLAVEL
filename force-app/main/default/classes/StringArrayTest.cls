public class StringArrayTest {
	
    public static List<String> generateStringArray(integer numberOfstring)
    {
        List<String> ArrayTest = new List<String>();
        for(integer i=0; i<numberOfString; i++)
        {
            ArrayTest.add('Test ' + i );
            system.debug('[ArrayTest] String '+i+' : ' + ArrayTest.get(i));
        }
        return ArrayTest;
    }
}