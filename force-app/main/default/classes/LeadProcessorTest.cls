@isTest
public with sharing class LeadProcessorTest {

@TestSetup
static void makeData(){
	TestDataFactory.createDynamicTestRecords(0,0,200);
}

 static testmethod void should_update_LeadSource() {

	/*
	   In the test class, insert 200 Lead records, execute the 'LeadProcessor' Batch class and test that all Lead records were updated correctly.
	   The unit tests must cover all lines of code included in the LeadProcessor class, resulting in 100% code coverage.
	   . */

    Test.startTest();
    LeadProcessor lp = new LeadProcessor();
    Id batchId = Database.executeBatch(lp);
    Test.stopTest();

    System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);

	
    }

}