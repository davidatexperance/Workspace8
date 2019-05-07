global class DailyLeadProcessor implements Schedulable {

global void execute(SchedulableContext ctx) {
	List<Lead> records = [SELECT Id, LeadSource FROM Lead LIMIT 200];
	List<Lead> updatedLeads = new List<Lead>();

	for (Lead lead : records) {
		lead.LeadSource = 'DreamForce';
		updatedLeads.add(lead);
	}

	update updatedLeads;
}
}