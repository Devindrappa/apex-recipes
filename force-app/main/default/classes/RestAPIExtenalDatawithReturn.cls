public with sharing class RestAPIExtenalDatawithReturn {
    
    @AuraEnabled(cacheable=true)
    public static String callExternalGetAPI(String id) {

        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.googleapis.com/books/v1/volumes?langRestrict=en&q=abc');
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            System.debug('Success -> '+response.getBody());
            return response.getBody();
        }else{
            System.debug('Error -> '+response.getBody());
            return response.getBody();
        }
    }
}