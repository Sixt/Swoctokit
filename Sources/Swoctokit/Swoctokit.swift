//
//  Swoctokit.swift
//  App
//
//  Created by franz busch on 14.05.18.
//

import Vapor
import Foundation

public class Swoctokit {

    private let application: Application
    private let client: Client

    public let repository: RepositoryService

    public init(token: String) throws {
        let env = try Environment.detect()
        let config = Config.default()
        var services = Services.default()
        var middlewares = MiddlewareConfig()
        middlewares.use(ErrorMiddleware.self)
        services.register(middlewares)
        let app = try Application(config: config, environment: env, services: services)

        self.application = app
        self.client = try application.client()
        self.repository = RepositoryService(token: token, client: client)
    }



}
