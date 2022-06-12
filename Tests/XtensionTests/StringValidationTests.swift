import XCTest
@testable import Xtension

final class StringValidationTests: XCTestCase {
    
    func testRegexValidation() {
        XCTAssertEqual("hello world".validate(pattern: #"(\w)\s(\w)"#), true)
    }
    
    func testEmailValidation() {
        XCTAssertEqual("mail@example.com".validate(pattern: .email), true)
        XCTAssertEqual("example.com".validate(pattern: .email), false)
    }
    
    func testUrlValidation() {
        XCTAssertEqual("example.com".validate(pattern: .url), true)
        XCTAssertEqual("www.example.com".validate(pattern: .url), true)
        XCTAssertEqual("http://example.com".validate(pattern: .url), true)
        XCTAssertEqual("https://example.com".validate(pattern: .url), true)
        XCTAssertEqual("http://www.example.com".validate(pattern: .url), true)
        XCTAssertEqual("https://sub.example.com".validate(pattern: .url), true)
        XCTAssertEqual("https://sub.example.com/index.html".validate(pattern: .url), true)
    }
}
