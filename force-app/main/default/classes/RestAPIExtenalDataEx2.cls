public with sharing class RestAPIExtenalDataEx2 {
    public static void callExternalGetAPI() {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://reqbin.com/echo/get/json');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            System.debug('Success -> '+response.getBody());
            System.debug('Success -> '+response);
        }else{
            System.debug('Error -> '+response.getBody());
        }
    }
}