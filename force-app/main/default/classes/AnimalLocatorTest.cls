@isTest
public with sharing class AnimalLocatorTest {
    
   private class Mock implements HttpCalloutMock {
       public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        
        String json = '{\"animal\":{\"id\":1,\"name\":\"chicken\",\"eats\":\"chicken food\",\"says\":\"cluck cluck\"}}';
        if (request.getEndpoint().endsWith('1')) {
            response.setBody(json);
            response.setStatusCode(200);
        } else {
            response.setBody('');
            response.setStatusCode(401);
        }

        return response;
    }
   }
    
    
    
    @isTest
    static void should_return_values() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String animalName = AnimalLocator.getAnimalNameByID(1);

        System.assertEquals('chicken', animalName); 

    }

    @isTest
    static void should_not_return_values() {

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String animalName = AnimalLocator.getAnimalNameByID(0);

        System.assertEquals('', animalName); 
        

    }
}