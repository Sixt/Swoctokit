import XCTest

import Vapor
import Swoctokit

final class AppTests: XCTestCase {
    func testNothing() throws {
        let config = Config.default()
        var services = Services.default()
        let router = EngineRouter.default()
        services.register(router, as: Router.self)
        var middlewares = MiddlewareConfig()
        middlewares.use(ErrorMiddleware.self)
        services.register(middlewares)
        let app = try Application(config: config, environment: try Environment.detect(), services: services)

        try app.run()
    }

    func test() throws {
        let config = Config.default()
        var services = Services.default()
        let router = EngineRouter.default()
        services.register(router, as: Router.self)
        var middlewares = MiddlewareConfig()
        middlewares.use(ErrorMiddleware.self)
        services.register(middlewares)
        let serverConfiure = NIOServerConfig.default(hostname: "0.0.0.0", port: 8080)
        services.register(serverConfiure)
        let app = try Application(config: config, environment: try Environment.detect(), services: services)
        let swoctokit = try Swoctokit(token: "1abf73f5f97178ce250e9e00eebe52a423dc0d1c", application: app)
        try swoctokit.contents.getContents(organization: "e-Sixt", repository: "orangebot-commands", path: "test.txt", ref: "master").flatMap { contents in
            return swoctokit.contents.updateFile(organization: "e-Sixt", repository: "orangebot-commands", path: "test.txt", message: "hello", content: "hello franz1", sha: contents.sha, branch: "master")
        }.wait()

    }

    static let allTests = [
        ("testNothing", testNothing)
    ]
}
