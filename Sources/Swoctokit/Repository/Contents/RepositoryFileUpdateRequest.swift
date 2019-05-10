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

struct RepositoryFileUpdateRequest: Encodable {

    let path: String
    let message: String
    let content: String
    let sha: String
    let branch: String

}
