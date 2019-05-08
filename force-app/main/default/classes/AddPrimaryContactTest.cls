@isTest
public with sharing class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){
	    TestDataFactory.createDynamicTestRecords(100,0,0);
        
        List<Account> accounts = [SELECT Id, Name, BillingState FROM Account LIMIT 50];
        List<Account> newAccounts = new List<Account>();
        System.debug(accounts);

        for (Account a: accounts) {
            a.BillingState = 'NY';
            newAccounts.add(a);
        }
        update newAccounts;
        newAccounts.clear();

        accounts = [SELECT Id, Name, BillingState FROM Account WHERE BillingState = Null];
        for (Account a: accounts) {
            a.BillingState = 'CA';
            newAccounts.add(a);
        }
        
        update newAccounts;
        System.debug(newAccounts);
    }

    @isTest
    static void should_add_primary_contacts() {
        Contact contact = new Contact(
            FirstName='Fred',
            LastName='Flinstone'
        );

        AddPrimaryContact addPC = new AddPrimaryContact(contact, 'CA');

        Test.startTest();
        System.enqueueJob(addPC);
        Test.stopTest();

        System.assertEquals(50, [Select count() FROM Contact]);
    }

    @isTest
    static void should_not_add_primary_contacts_if_state_id_is_wrong() {
        Contact contact = new Contact(
            FirstName='Fred',
            LastName='Flinstone'
        );

        AddPrimaryContact addPC = new AddPrimaryContact(contact, 'CAC');

        Test.startTest();
        System.enqueueJob(addPC);
        Test.stopTest();

        System.assertEquals(0, [Select count() FROM Contact]);
    }
}