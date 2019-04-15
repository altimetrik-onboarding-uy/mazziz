@isTest
private class TestClass {
	
	@testSetup 
    static void setup() {
        List<Work__c> works = new List<Work__c>();
        List<Contact> contacts = new List<Contact>();

        // insert contacts
        for (Integer i=0;i<5;i++) {
            contacts.add(new Contact(FirstName='FirstName_'+i,LastName='LastName_'+i,email='mazziz@altimetrik.com'));
        }
        insert contacts;
        // insert 20 works
        for (Integer i=0;i<5;i++) {
            works.add(new Work__c(Title__C='Work_Ready_'+i, Difficulty__c=21,Estimated_End_Time__c=DateTime.newInstance(2019, 12, 12, 23, 0, 3),Contact__c=contacts[0].Id,Status__c='New',Type__c='Idea'));
        }
        for (Integer i=0;i<5;i++) {
            works.add(new Work__c(Title__C='Work_New'+i, Difficulty__c=8,Estimated_End_Time__c=DateTime.newInstance(2019, 12, 12, 23, 0, 3),Contact__c=contacts[0].Id,Status__c='Ready',Type__c='Action'));
        }
        for (Integer i=0;i<5;i++) {
            works.add(new Work__c(Title__C='Work_InProgress'+i, Difficulty__c=3,Estimated_End_Time__c=DateTime.newInstance(2019, 12, 12, 23, 0, 3),Start_Date__c=DateTime.newInstance(2019, 1, 1, 23, 0, 3),Contact__c=contacts[0].Id,Status__c='InProgress',Type__c='Fix'));
        }
        for (Integer i=0;i<5;i++) {
            works.add(new Work__c(Title__C='Work_Done'+i, Difficulty__c=15,Estimated_End_Time__c=DateTime.newInstance(2019, 12, 12, 23, 0, 3),Start_Date__c=DateTime.newInstance(2019, 1, 1, 23, 0, 3),Contact__c=contacts[1].Id,Status__c='Done',Type__c='Idea'));
        }

        insert works;
    }
    
    @isTest static void  testschedule() {
        String sch =  '0 0 0 ? * * *';
        String jobId = System.schedule('ScheduleApexClassTest',  sch, new schedulableEmailWorksOverdue());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        Test.startTest();
        schedulableEmailWorksOverdue sh1 = new schedulableEmailWorksOverdue();   
        system.schedule('Test check', sch, sh1);
        Test.stopTest();
        System.assertEquals(0, ct.TimesTriggered);
        System.debug('Next fire time: ' + ct.NextFireTime); 

    }

    @isTest static void testBatchMail() {   
        List<Contact> testContact =[SELECT FirstName FROM Contact WHERE FirstName='FirstName_1'];
        Test.startTest();   
        BatchEmailWorksOverdue b = new BatchEmailWorksOverdue();
        DataBase.executeBatch(b);
        // Verify
        
        Test.stopTest();
        System.assertEquals(1, testContact.size());
    }

     @isTest static void testGetWorksNew() {
        List<Work__c> works = WorkCardController.getWorksNew();
        System.assertEquals(5,works.size());
    }
    
      @isTest static void testGetWorksReady() {
        List<Work__c> works = WorkCardController.getWorksReady();
        System.assertEquals(5, works.size());
    }
    
      @isTest static void testGetWorksInProgress() {
        List<Work__c> works = WorkCardController.getWorksInProgress();
        System.assertEquals(5, works.size());
    }
      @isTest static void testGetWorksDone() {
        List<Work__c> works = WorkCardController.getWorksDone();
        Integer counter = works.size();
        System.assertEquals(5, works.size());
    }
      
      @isTest static void testGetWorksForClient() {
        
        String clientId =[SELECT Id FROM Contact WHERE FirstName='FirstName_1'].Id;  
        List<Work__c> works = WorkCardController.getWorksForContact(clientId,'Done');
        System.assertEquals(5, works.size());
    }
	
        @isTest static void testWorksWithStartDates() {
        Test.startTest();
        List<Work__c> workList = [SELECT Status__c FROM Work__c];

        for(Work__c work :workList){
            if(work.Status__c=='InProgress'){
                work.Status__c = 'Ready';
            }
        }
        update workList;
        Test.stopTest();


        List<Work__c> works =[SELECT Id FROM Work__c WHERE Start_Date__c!=NULL];
        System.assertEquals(15, works.size());
    }
    
}