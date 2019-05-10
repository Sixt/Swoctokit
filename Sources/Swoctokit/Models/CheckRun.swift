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

public struct CheckRun: Decodable {

    public let id: Int
    public let name: String
    public let headSha: String
    public let status: String
    public let conclusion: String?
    public let completedAt: Date?
    public let pullRequests: [PullRequest]

}
