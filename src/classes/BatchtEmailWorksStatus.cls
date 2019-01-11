global class BatchtEmailWorksStatus implements Database.Batchable<sObject> {
	
	
    global String [] defaultEmail = new String[] {'0031U000003fph9QAA'};
	
	/*global BatchtEmailWorksStatus() {
		
	}*/
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('SELECT Name, Difficulty__c,End_Date__c,Status__c FROM Work__c  WHERE End_Date__c <= TODAY AND Status__c !=\'Done\'');
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          mail.toAddresses =defaultEmail;
          mail.subject='Batch Processing ';
          Integer cantidad = 0;
          for(sObject con : scope){
             cantidad++;
          }
          mail.plainTextBody='Hay '+cantidad+' works que todavia no estan en Done al dia de hoy';
		  Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {mail};
          Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
		  if (results[0].success) {
  		  System.debug('The email was sent successfully.');
		  } else {
          System.debug('The email failed to send: '+ results[0].errors[0].message);
		  }

	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}