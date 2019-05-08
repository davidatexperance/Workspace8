global with sharing class LeadProcessor implements Database.Batchable<sObject> {

/* Create an Apex class called 'LeadProcessor' that uses the Database.Batchable interface.
    Use a QueryLocator in the start method to collect all Lead records in the org.
    The execute method must update all Lead records in the org with the LeadSource value of 'Dreamforce'.
    Create an Apex test class called 'LeadProcessorTest'. */

global Database.QueryLocator start(Database.BatchableContext bc) {
	return Database.getQueryLocator(
		'SELECT Id, LeadSource FROM Lead'
	);
}

global void execute(Database.BatchableContext bc, List<Lead> records) {
    List<Lead> updatedLeads = new List<Lead>();
    for (Lead lead : records) {
        lead.LeadSource = 'DreamForce';
        updatedLeads.add(lead);
    }

    update updatedLeads;

}

global void finish(Database.BatchableContext bc) {
    

}

}