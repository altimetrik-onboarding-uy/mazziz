public with sharing class WorkCardController {
    @AuraEnabled
    public static List<Work__c> getWorksNew () {
        return [SELECT Id, Title__c, Type__c, Difficulty__c,Status__c FROM Work__c WHERE Start_Date__c  = LAST_N_DAYS:30 AND Status__c = 'New' ] ;
    }
     @AuraEnabled
        public static List<Work__c> getWorksReady () {
        return [SELECT id,Title__c, Type__c, Difficulty__c,Status__c FROM Work__c WHERE Start_Date__c  = LAST_N_DAYS:30 AND Status__c = 'Ready'] ;
    }
     @AuraEnabled
        public static List<Work__c> getWorksInProgress () {
        return [SELECT id,Title__c, Type__c, Difficulty__c,Status__c FROM Work__c WHERE Start_Date__c  = LAST_N_DAYS:30 AND Status__c = 'InProgress'] ;
    }
     @AuraEnabled
        public static List<Work__c> getWorksDone () {
        return [SELECT id,Title__c, Type__c, Difficulty__c,Status__c FROM Work__c WHERE Start_Date__c  = LAST_N_DAYS:30 AND Status__c = 'Done'] ;
    }
}