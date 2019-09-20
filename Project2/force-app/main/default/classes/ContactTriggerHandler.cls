public class ContactTriggerHandler {
    public static List<Contact> checkForDuplicates(List<Contact> newContacts){
        //Step 1: Extract email from the new contacts.
        Set<String> newEmailSet = new Set<String>();
        for(Contact c: newContacts){
            if(c.email != null){
                newEmailSet.add(c.email);
            }
        }
        
        //Step 2: Find duplicates contacts from the database.
        Map<String, Contact> existingContactMap = new Map<String, Contact>();
        for(Contact existingContact: [SELECT id, lastname, email FROM Contact WHERE email in :newEmailSet]){
            existingContactMap.put(existingContact.email, existingContact);
        }
        
        //Step 3: Compare and throw erro
        for(Contact c: newContacts){
            Contact duplicateContact = existingContactMap.get(c.email);
            if(duplicateContact != null){
                c.addError('ERROR: There is already an identical record.', false);
            }
        }
        return newContacts;
    }
}