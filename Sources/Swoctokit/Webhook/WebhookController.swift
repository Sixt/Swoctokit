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
            if let future = try? req.content.decode(json: PullRequestEvent.self, using: .convertFromSnakeCase) {
                let pullRequestEvent = try future.wait()
                delegate?.didReceive(event: pullRequestEvent)
            }
        case .commitComment:
            if let future = try? req.content.decode(json: CommitCommentEvent.self, using: .convertFromSnakeCase) {
                let commitCommentEvent = try future.wait()
                delegate?.didReceive(event: commitCommentEvent)
            }
        case .issueComment:
            if let future = try? req.content.decode(json: IssueCommentEvent.self, using: .convertFromSnakeCase) {
                let issueCommentEvent = try future.wait()
                delegate?.didReceive(event: issueCommentEvent)
            }
        case .checkRun:
            if let future = try? req.content.decode(json: CheckRunEvent.self, using: .convertFromSnakeCase) {
                let checkRunEvent = try future.wait()
                delegate?.didReceive(event: checkRunEvent)
            }
        }

        return .ok
    }

}
