public with sharing class ParkLocator {
    public static List<String> country(String countryName) {
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        List<String> results = ps.byCountry('Germany');
        System.debug(results);
        return results;
    }
}