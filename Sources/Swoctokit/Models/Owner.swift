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


public struct Owner: Decodable {

    public let login: String
    public let id: Int
    public let nodeId: String

}
