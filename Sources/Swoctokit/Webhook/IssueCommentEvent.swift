//
//  IssueCommentEvent.swift
//  Swoctokit
//
//  Created by Franz Busch on 14.11.18.
//

import Foundation

public struct IssueCommentEvent: Decodable, WebhookEvent {

    public let action: String
    public let issue: Issue
    public let repository: Repository
    public let comment: Comment

}

public struct Issue: Decodable {

    public let number: Int

}
