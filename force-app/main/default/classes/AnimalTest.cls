@IsTest
public class AnimalTest {
	
	static testMethod void testParse() {
		String json = '{\"animal\":{\"id\":1,\"name\":\"chicken\",\"eats\":\"chicken food\",\"says\":\"cluck cluck\"}}';
		Animal.Animal_Z obj = Animal.parse(json);
		System.assert(obj != null);
	}
}