@isTest
public with sharing class DailyLeadProcessorTest {
@TestSetup
static void makeData(){
	TestDataFactory.createDynamicTestRecords(0,0,200);
}

public static String CRON_EXP='0 0 0 15 3 ? 2022';

static testmethod void should_update_LeadSource() {

	Map<Id, Lead> leads = new Map<Id,Lead>([SELECT Id FROM LEAD]);
	List<Id> leadIds = new List<Id>(leads.keySet());

	Test.startTest();
	//Shedule the test job
	String jobId = System.schedule('ScheduledApexTest',
	                               CRON_EXP,
	                               new DailyLeadProcessor());
	List<Task> lt = [SELECT Id FROM Task WHERE WhatId IN :leadIds];
	System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
	Test.stopTest();

	System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);


}

}