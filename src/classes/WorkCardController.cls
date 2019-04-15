public with sharing class WorkCardController {
    //Methods to return a list for each type of state
    @AuraEnabled
    public static List<Work__c> getWorksNew () {
        //
        return [SELECT Id, Title__c, Type__c, Difficulty__c,Status__c FROM Work__c WHERE CreatedDate  = LAST_N_DAYS:30 AND Status__c = 'New' ] ;
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
    //Methods to return a list of works for a particular contact id and state
         @AuraEnabled
        public static List<Work__c> getWorksForContact (Id id, String workStatus) {
        return [SELECT id,Title__c, Type__c, Difficulty__c,Status__c,Contact__c FROM Work__c WHERE Start_Date__c = LAST_N_DAYS:30 AND Status__c =:workStatus
                AND  
                Contact__c IN(SELECT Contact.Id FROM Contact WHERE Id=:id)];
    }
}