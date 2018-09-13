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

public struct PullRequest: Decodable {

    public struct Head: Decodable {

        public struct Repo: Decodable {
            public let id: Int
            public let name: String
            public let fullName: String

            private enum CodingKeys: String, CodingKey {
                case id
                case name
                case fullName = "full_name"
            }
        }

        public let label: String
        public let ref: String
        public let sha: String
        public let repo: Repo
    }

    public let id: Int
    public let number: Int
    public let state: String
    public let title: String
    public let body: String
    public let head: Head

}
