@RestResource(urlMapping='/Account/*')
global with sharing class RestAccountOperations {
    // public RestAccountOperations() {

    // }
    
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static List<Account> doGet() {
        /*RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);*/
        
        Map<String, String> reqParams= RestContext.request.params;
        String accIndustry = reqParams.get('industry');
        
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE Name = :accIndustry];
        return result;
    }
  
    @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return account.Id;
    }
}