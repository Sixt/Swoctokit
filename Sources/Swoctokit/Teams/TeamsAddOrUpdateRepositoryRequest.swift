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

public enum RepositoryPermission: String, Encodable {
    case pull
    case push
    case admin
}

struct TeamsAddOrUpdateRepositoryRequest: Encodable {

    let permission: RepositoryPermission?

}
