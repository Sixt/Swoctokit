import XCTest

import Swoctokit

final class AppTests: XCTestCase {
    func testNothing() throws {
        let swoctokit = try Swoctokit(token: "")
        let response = swoctokit.repository.createRepository(organization: "e-Sixt", name: "Test", description: "Test", isPrivate: true)
        try response.wait()
    }

    static let allTests = [
        ("testNothing", testNothing)
    ]
}
