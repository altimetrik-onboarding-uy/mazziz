global class schedulableEmailWorksOverdue implements Schedulable{
    global void execute(SchedulableContext sc) {
       BatchEmailWorksOverdue  batchToExecute = new BatchEmailWorksOverdue(); 
       database.executebatch(batchToExecute);
    }
}