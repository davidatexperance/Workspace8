public with sharing class AccountProcessor {
    
    //TODO Users should be able to update Number_of_Contacts__c, identified by a list of Account Ids
    @future
    public static void countContacts(List<Id> recordIds) {


        try {
        
        List<Account> accounts = [Select Id FROM Account WHERE Id IN :recordIds];
        List<Contact> contacts = [Select Id, AccountId FROM Contact WHERE AccountId IN :recordIds ORDER BY AccountId];

        Integer indexContacts = 0;
        Integer indexAccounts = 0;
        for (Account a : accounts) {
            a.Number_of_Contacts__c = 0;
            while (contacts[indexContacts].AccountId == a[indexAccounts].Id) {
                a.Number_of_Contacts__c ++;
                indexContacts ++;
            }
        }

        update accounts;

        } catch (DmlExpection e) {
            System.debug('Something bad happened: ' + e.getMessage());
        }
    }


    
}
