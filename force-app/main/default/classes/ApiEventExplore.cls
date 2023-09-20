public with sharing class ApiEventExplore {

    public ApiEventExplore()
    {
        //Constructor
    }

    @AuraEnabled(cacheable=true)
    public static List<ApiEvent> getApiEvents(){
        List<ApiEvent> mesApiEvents = [SELECT id, EventDate, ApiType, Query, Records, RowsProcessed FROM ApiEvent]; //Operation, 

        system.debug('£££ MCLA - getApiEvents - NB mesApiEvents : ' + mesApiEvents.size());
        system.debug('£££ MCLA - getApiEvents - mesApiEvents : ' + mesApiEvents);

        return mesApiEvents;
    }

}