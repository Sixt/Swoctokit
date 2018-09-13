//===----------------------------------------------------------------------===//
//
// This source file is part of the Swoctokit open source project
//
// Copyright (c) 2018 e-Sixt
// Licensed under MIT
//
// See LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import Vapor

public class SwoctokitWebhookClient {

    private let application: Application


    public init(_ application: Application) throws {
        self.application = application
        try setupRoutes()
    }

    private func setupRoutes() throws {
        let router = try application.make(Router.self)

        try WebhookController().boot(router: router)
    }

}
