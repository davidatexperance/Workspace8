/* create an Apex REST class that is accessible at '/Accounts/<Account_ID>/contacts'.
 The service will return the account's ID and Name plus the ID and Name of all contacts
  associated with the account */

@RestResource(urlMapping='/Accounts/*/contacts')  //'/Accounts/<Account_ID>/contacts
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount () {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
 /*        List<String> resultPieces = request.requestURI.split('/');
        String accountId = resultPieces[resultPieces.size()-2];
  */       
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account results = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id = :accId];

/*         Account resultAccount = [SELECT Id, Name FROM Account WHERE Id = :accountId];
        List<Contact> resultContacts = [SELECT Id, Name FROM Contact WHERE AccountId = :accountId];
        
        List<List<String>> results = new List<List<String>>();
        results.add(new List<String>{resultAccount.Id, resultAccount.Name});
        
        for (Contact c : resultContacts) {
            List<String> item = new List<String>{c.Id, c.Name};
            results.add(item);
        }
 */
        return results;
    }
}