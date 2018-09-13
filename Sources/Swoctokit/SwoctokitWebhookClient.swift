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

public protocol PullRequestEventListener: class {

    func pullRequestEventReceived(_ pullRequestEvent: PullRequestEvent)

}

public class SwoctokitWebhookClient {

    private let application: Application

    private var pullRequestEventListeners = [PullRequestEventListener]()


    public init(_ application: Application) throws {
        self.application = application
        try setupRoutes()
    }

    private func setupRoutes() throws {
        let router = try application.make(Router.self)

        let webhookController = WebhookController()
        webhookController.delegate = self
        try webhookController.boot(router: router)
    }

    public func addPullRequestEventListener(_ listener: PullRequestEventListener) {
        pullRequestEventListeners.append(listener)
    }

}

extension SwoctokitWebhookClient: WebhookControllerDelegate {

    func didReceive(event: WebhookEvent) {
        switch event {
        case let event as PullRequestEvent:
            pullRequestEventReceived(event)
        default:
            break
        }
    }

    func pullRequestEventReceived(_ event: PullRequestEvent) {
        pullRequestEventListeners.forEach { $0.pullRequestEventReceived(event) }
    }

}
