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



public protocol WebhookEvent {

}

protocol WebhookControllerDelegate: class {

    func didReceive(event: WebhookEvent)

}

final class WebhookController: RouteCollection {

    weak var delegate: WebhookControllerDelegate?

    func boot(router: Router) throws {
        let route = router.grouped("webhooks")
        route.post("", use: postHandler)
    }

    func postHandler(_ req: Request) throws -> HTTPStatus {
        guard let header = req.http.headers["X-GitHub-Event"].first else {
            return .ok
        }

        guard let eventType = EventType(rawValue: header) else {
            return .ok
        }

        do {
            switch eventType {
            case .pullRequest:
                try req.content.decode(PullRequestEvent.self, delegate: delegate)
            case .commitComment:
                try req.content.decode(CommitCommentEvent.self, delegate: delegate)
            case .issueComment:
                try req.content.decode(IssueCommentEvent.self, delegate: delegate)
            case .checkRun:
                try req.content.decode(CheckRunEvent.self, delegate: delegate)
            }
        } catch {
            print(error)
        }

        return .ok
    }

}

extension ContentContainer {
    fileprivate func decode<D: Decodable & WebhookEvent>(_ decodable: D.Type, delegate: WebhookControllerDelegate?) throws {
        let future = try decode(json: decodable, using: .convertFromSnakeCase)
        future.whenSuccess { delegate?.didReceive(event: $0) }
        future.whenFailure { print($0) }
    }
}
