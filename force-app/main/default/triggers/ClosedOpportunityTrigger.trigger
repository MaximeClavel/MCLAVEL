trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
	
    List<Task> MyListTasks = new List<Task>();
    
    for(Opportunity opp: Trigger.new)
    {
        if(opp.stageName == 'Closed Won')
        {
			Task MyTask = new Task(Subject='Follow Up Test Task', whatId=opp.id);
            MyListTasks.add(MyTask);
			
        }
    }
    
    insert MyListTasks;
    
}