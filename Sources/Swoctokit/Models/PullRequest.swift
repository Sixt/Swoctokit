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

public struct PullRequest: Decodable {

    public struct Branch: Decodable {
        public let label: String?
        public let ref: String
        public let sha: String
        public let repo: Repository
    }

    public struct Label: Decodable {
        public let name: String
        public let color: String
    }

    public let id: Int
    public let number: Int
    public let state: String?
    public let title: String?
    public let body: String?
    public let head: Branch
    public let base: Branch
    public let labels: [Label]?

}
