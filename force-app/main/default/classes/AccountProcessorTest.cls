@isTest
public with sharing class AccountProcessorTest {
    
    @TestSetup
    static void makeData(){
        TestDataFactory.createStaticTestRecords();
    }
    @isTest
    public void AccountProcessorTest() {
        
        List<Id> recordIds = [Select Id FROM Account LIMIT 3];



        AccountProcessor.countContacts(recordIds);

        List<Integer> totals = [Select Number_of_Contacts__c FROM Account WHERE Id IN :recordIds]; 

        //Not Null Assertions
        for (Integer n : totals) {
            System.assert(!Integer.i==null, 'Did not create data for Account ' + n);
        }


    }
}

