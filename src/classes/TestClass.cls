@isTest
private class TestClass {
	
	/*@testSetup 
    static void setup() {
        List<Work__c> works = new List<Work__c>();
        // insert 10 works
		Datetime myDateTime = Datetime.newInstance(2019, 2, 17);
        for (Integer i=0;i<10;i++) {
            works.add(new Work__c(Title__C='Work_'+i, Difficulty__c=21,End_Date__c=myDateTime));
        }
        insert works;
    }*/

	static testmethod void test() {        
        Test.startTest();
        BatchtEmailWorksStatus uca = new BatchtEmailWorksStatus();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from work__c]);
    }
	
}