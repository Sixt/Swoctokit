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

import Foundation

public struct Branch: Decodable {

    public let name: String
    public let commit: Commit
    public let protected: Bool
    public let protection: Protection?

}

extension Branch {
    public struct Commit: Decodable {
        public let sha: String
    }

    public struct Protection: Decodable {
        public let enabled: Bool
        public let requiredStatusChecks: RequiredStatusChecks
        public let requiredPullRequestReviews: RequiredPullRequestReviews?
    }
}

extension Branch.Protection {
    public struct RequiredStatusChecks: Decodable {
        public let enforcementLevel: String
        public let contexts: [String]
    }

    public struct RequiredPullRequestReviews: Decodable {
        public let requiredApprovingReviewCount: Int
    }
}
