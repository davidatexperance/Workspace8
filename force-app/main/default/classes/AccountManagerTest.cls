@isTest
public with sharing class AccountManagerTest {

@TestSetup
static void makeData(){
	TestDataFactory.createDynamicTestRecords(2,4,0);

}

@isTest
static void returns_results() {
	Map<Id,SObject> accounts =  (new Map<Id,SObject>([SELECT Id FROM Account]));
	List<Id> ids = new List<Id>(accounts.keySet());

	RestRequest request = new RestRequest();
	request.requestURI = ' https://curious-moose-6avd4z-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
	                     + ids.get(0)
	                     + '/contacts';
	request.httpMethod = 'GET';
	RestContext.request = request;

	Account thisAccountAndContacts = AccountManager.getAccount();

	System.assertEquals(ids.get(0),thisAccountAndContacts.Id);
}
}
