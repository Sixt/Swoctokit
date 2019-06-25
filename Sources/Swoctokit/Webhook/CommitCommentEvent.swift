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
