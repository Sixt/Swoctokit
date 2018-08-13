import XCTest

import Swoctokit

final class AppTests: XCTestCase {
    func testNothing() throws {
        let swoctokit = try Swoctokit(token: "bae5d647757d28a904080b28e0936ea19bd898b7")
        let response = swoctokit.repository.createRepository(organization: "e-Sixt", name: "Test", description: "Test", isPrivate: true)
        try response.wait()
    }

    static let allTests = [
        ("testNothing", testNothing)
    ]
}
