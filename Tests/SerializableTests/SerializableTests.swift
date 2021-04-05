import XCTest
@testable import Serializable

final class SerializableTests: XCTestCase {
    
    struct TestResource: Serializable, Equatable{
        let id: String
        let title: String
        let tag: [String]
        let content: String
    }
    
    func testSerialize() {
        
        let testResource = TestResource(id: "001", title: "Hello!", tag: ["Introduction"], content: "# Hi there! I'm Enchan.")
        
        let serialized = testResource.serialize()
        XCTAssertNotNil(serialized)
        
        print("Serialized object:")
        print(serialized!)
        
        let deserialized = TestResource.deserialize(object: serialized!)
        
        XCTAssertEqual(testResource, deserialized)
        
    }

    static var allTests = [
        ("testExample", testSerialize),
    ]
}
