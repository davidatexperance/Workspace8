@isTest
global with sharing class AnimalLocatorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request) {
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
