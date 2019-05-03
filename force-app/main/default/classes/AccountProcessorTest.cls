@isTest
public with sharing class AccountProcessorTest {

@TestSetup
static void makeData(){
	TestDataFactory.createStaticTestRecords();
}
@isTest
public static void should_create_contact_totals() {

	Map<Id, Account> mapAccount = new Map<Id,Account>([Select Id FROM Account LIMIT 3]);
	List<Id> recordIds = new List<Id>(mapAccount.keySet());

	Test.startTest();
	AccountProcessor.countContacts(recordIds);
	Test.stopTest();

	List<Account> totals = [Select Name, Number_of_Contacts__c FROM Account WHERE Id IN :recordIds];

	//Not Null Assertions
	for (Account n : totals) {
		System.assert (!(n.Number_of_Contacts__c==null), 'Did not create data for Account ' + n.Name);
	}
}


}