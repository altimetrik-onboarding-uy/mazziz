global class BatchEmailWorksOverdue implements Database.Batchable<sObject>,Database.Stateful{
	
	global String [] defaultEmail = new String[] {'0031U000003fph9QAA'};
	global Integer counter = 0;
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('SELECT Name, Difficulty__c,End_Date__c,Status__c FROM Work__c  WHERE End_Date__c <= TODAY AND Status__c !=\'Done\'');
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		
          for(sObject con : scope){
             counter=counter+1;
          }
	}
	
	global void finish(Database.BatchableContext BC) {
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.toAddresses=defaultEmail;
		mail.subject='Batch Processing ';
		mail.plainTextBody='We have '+counter+' works that are not in Done state for today.';
		Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {mail};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
		if (results[0].success) {
  		System.debug('The email was sent successfully');
		} else {
        System.debug('The email failed to send: '+ results[0].errors[0].message);
		}
	}
	
}