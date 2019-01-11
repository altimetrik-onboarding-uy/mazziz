global with sharing class  managerMailWorkReportBatchh implements Schedulable {
	global void execute(SchedulableContext sc) {
       BatchtEmailWorksStatus  batchToExecute = new BatchtEmailWorksStatus(); 
       database.executebatch(batchToExecute);
	}
}