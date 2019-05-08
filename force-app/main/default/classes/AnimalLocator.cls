public with sharing class AnimalLocator {
    public static String getAnimalNameByID(Integer id) {
        System.debug(id);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        String animalName = '';

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            animalName = (String)animal.get('name');
        } else {
            animalName = '';
            System.debug('Error HTTP Web Call.  Status  ' + response.getStatusCode());
        }

        return animalName;
    }
}