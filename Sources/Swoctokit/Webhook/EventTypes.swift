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

public enum EventType: String {
    case pullRequest = "pull_request"
    case commitComment = "commit_comment"
    case issueComment = "issue_comment"
    case checkRun = "check_run"
}
