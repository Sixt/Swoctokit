//
//  PullRequest.swift
//  Swoctokit
//
//  Created by Franz Busch on 14.11.18.
//

import Foundation

public struct PullRequest: Decodable {

    public struct Head: Decodable {

        public let label: String
        public let ref: String
        public let sha: String
        public let repo: Repository
    }

    public let id: Int
    public let number: Int
    public let state: String
    public let title: String
    public let body: String
    public let head: Head

}
