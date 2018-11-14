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

        switch eventType {
        case .pullRequest:
            if let pullRequestEvent = try? req.content.syncDecode(PullRequestEvent.self) {
                delegate?.didReceive(event: pullRequestEvent)
            }
        case .commitComment:
            if let commitCommentEvent = try? req.content.syncDecode(CommitCommentEvent.self) {
                delegate?.didReceive(event: commitCommentEvent)
            }
        case .issueComment:
            if let issueCommentEvent = try? req.content.syncDecode(IssueCommentEvent.self) {
                delegate?.didReceive(event: issueCommentEvent)
            }
        }

        return .ok
    }

}
