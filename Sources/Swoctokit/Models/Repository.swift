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

public struct Repository: Decodable {

    public let id: Int
    public let nodeId: String?
    public let name: String
    public let fullName: String?
    public let owner: Owner?

}
