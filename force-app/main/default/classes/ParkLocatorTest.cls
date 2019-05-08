@isTest
public with sharing class ParkLocatorTest {
    @isTest
    static void ParkLocatorTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String countryName = 'Germany';
        List<String> results = ParkLocator.country(countryName);

        System.assert(results.size() > 0);

    }
}
