//
//  CommitCommentEvent.swift
//  Swoctokit
//
//  Created by Franz Busch on 14.11.18.
//

public struct CommitCommentEvent: Decodable, WebhookEvent {

    public let action: String
    public let comment: CommitComment

}

public struct CommitComment: Decodable {

    public let id: Int
    public let url: String
    public let body: String
    public let commitId: String

}
