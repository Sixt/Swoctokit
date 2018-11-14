//
//  File.swift
//  Swoctokit
//
//  Created by franz busch on 13.09.18.
//

public struct PullRequestEvent: Decodable, WebhookEvent {

    public let action: String
    public let number: Int
    public let pullRequest: PullRequest

    private enum CodingKeys: String, CodingKey {
        case action
        case number
        case pullRequest = "pull_request"
    }

}


