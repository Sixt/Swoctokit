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

public struct IssueCommentEvent: Decodable, WebhookEvent {

    public let action: String
    public let issue: Issue
    public let repository: Repository
    public let comment: Comment

}

public struct Issue: Decodable {

    public let number: Int

}
