public with sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact con, String state) {

        this.contact = con;
        if (state.length() == 2) {
            this.state = state;
        } else {
            System.debug('Error assigning State.  It needs to be a two digit abreviation');
        }
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [Select ID FROM Account WHERE BillingState = :this.state LIMIT 200];
        List<Contact> newContacts = new List<Contact>();

        for (Account a: accounts) {
            Contact c = this.contact.clone(false, true, false, false);
            c.AccountID = a.Id;
            newContacts.add(c);
        } 

        upsert newContacts;
    }
}
