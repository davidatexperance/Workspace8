public with sharing class AccountProcessor {


//TODO Users should be able to update Number_of_Contacts__c, identified by a list of Account Ids
@future
public static void countContacts(List<Id> recordIds) {

	List<Account> accounts = [Select Id FROM Account WHERE Id IN :recordIds ORDER BY Id];
	List<Contact> contacts = [Select Id, AccountId FROM Contact WHERE AccountId IN :recordIds ORDER BY AccountId];

	List<Account> updatedAccounts = new List<Account>();

	Integer indexContacts = 0;
	for (Account a : accounts) {
		a.Number_of_Contacts__c = 0;
		while (indexContacts < contacts.size() && contacts.get(indexContacts).AccountId == a.Id) {
			a.Number_of_Contacts__c++;
			indexContacts++;
		}
		updatedAccounts.add(a);
	}

	update updatedAccounts;
}
}