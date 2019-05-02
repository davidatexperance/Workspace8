@isTest
public with sharing class TestDataFactory {
//Several different ways to create test data.
    //  createStaticTestRecords
    //  createDynamicTestRecords( #Accounts, #ContactsPerAccount)
    //
    
    
    /* This TestDataFactory creates a test data with the following:
        * Accounts 4
        * Contacts 10 (linked to the accounts 1,2,3,4,1,2,3,4,1,2)
    */
    public static void createStaticTestRecords()  {
        // new install
        Account Account1 = new Account (name = 'Lightning Superbadge',
                                          BillingCity ='San Francisco',
                                          BillingCountry ='California'
                                         );
        insert Account1;

        Account Account2 = new Account (name = 'Apex Steel',
                                          BillingCity ='Cleveland',
                                          BillingCountry ='Ohio'
                                         );

        insert Account2;        
        
        Account Account3 = new Account (name = 'Aura Tech',
                                          BillingCity ='Manchester',
                                          BillingCountry ='New Hampshire'
                                         );
        
        insert Account3;        
        
        Account Account4 = new Account (name = 'Report Services',
                                          BillingCity ='Berlin',
                                          BillingCountry ='New Hampshire'
                                         );
        insert Account4;        
        
        // insert contacts
        Contact Contact1 = new Contact (
            FirstName = 'Jamie',
            LastName = 'Powell',
            AccountId = Account1.Id,
            email = 'jamie@trailheadboats.com'
        );
        insert Contact1;
        
        Contact Contact2 = new Contact (
            FirstName = 'Gayatri',
            LastName = 'Bhatt',
            AccountId = Account2.Id,
            email = 'gayatri@trailheadboats.com'
        );
        insert Contact2;
        
        Contact Contact3 = new Contact (
            FirstName = 'Aaron',
            LastName = 'Gray',
            AccountId = Account3.Id,
            email = 'aaron@trailheadboats.com'
        );
        insert Contact3;
        
        Contact Contact4 = new Contact (
            FirstName = 'Emanuel',
            LastName = 'Manzanares',
            AccountId = Account4.Id,
            email = 'emanuel@trailheadboats.com'
        );
        insert Contact4;
        
        Contact Contact5 = new Contact (
            FirstName = 'Rachel',
            LastName = 'King',
            AccountId = Account1.Id,
            email = 'rachel@trailheadboats.com'
        );
        insert Contact5;  
        
        Contact Contact6 = new Contact (
            FirstName = 'Takuya',
            LastName = 'Watanabe',
            AccountId = Account2.Id,
            email = 'takuya@trailheadboats.com'
        );
        insert Contact6;  
        
        Contact Contact7 = new Contact (
            FirstName = 'Clara',
            LastName = 'Figueroa',
            AccountId = Account3.Id,
            email = 'clara@trailheadboats.com'
        );
        insert Contact7;  
        
        Contact Contact8 = new Contact (
            FirstName = 'Liam',
            LastName = 'Bates',
            AccountId = Account4.Id,
            email = 'Liam@trailheadboats.com'
        );
        insert Contact8;  
        
        Contact Contact9 = new Contact (
            FirstName = 'Skye',
            LastName = 'Taylor',
            AccountId = Account1.Id,
            email = 'skye@trailheadboats.com'
        );
        insert Contact9;  
        
        Contact Contact10 = new Contact (
            FirstName = 'Millie',
            LastName = 'Brooks',
            AccountId = Account2.Id,
            email = 'millie@trailheadboats.com'
        );
        insert Contact10;  
        }

        /* Creates n accounts with n contacts */
        public static void createDynamicTestRecords(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> cons = new List<Contact>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];            
            // For each account just inserted, add contacts
            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,
                                     lastname='Test'+k,
                                     AccountId=acct.Id));
            }
        }
        // Insert all contacts for all accounts
        insert cons;
    }
}
