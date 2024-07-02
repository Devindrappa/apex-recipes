public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            List<Contact> res= [
                SELECT AccountId, Id, FirstName, LastName 
                FROM Contact 
                WHERE AccountId=: accId 
                WITH SECURITY_ENFORCED ];
                
                // WITH SECURITY_ENFORCED 
                system.debug('!try--->'+res);

                //System.debug(res);
            return res;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}