@isTest
public class TestVerifyDate {

    @isTest
    static void TestCheckDates ()
    {
        //record date in 30days
        Date maDate1 = date.newInstance(2019,10,01);
        Date maDate2 = date.newInstance(2019,10,02);
        
        Date dateResultIn30Days = VerifyDate.CheckDates(maDate1,maDate2);
        
        System.assertEquals(maDate2,dateResultIn30Days);
        
        //record date out of 30days
        Date maDate11 = date.newInstance(2019,10,01);
        Date maDate22 = date.newInstance(2019,11,21);
        
        Date dateResultOut30Days = VerifyDate.CheckDates(maDate11,maDate22);
        
        System.assertEquals(SetEndOfMonthDate(maDate11),dateResultOut30Days);
        
    }
    
    //method to return the end of the month of a given date
	private static Date SetEndOfMonthDate(Date date1) {
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return lastDay;
	}
        
}