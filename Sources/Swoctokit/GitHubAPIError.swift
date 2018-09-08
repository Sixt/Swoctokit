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

public struct GitHubApiError: Decodable {

    public let resource: String
    public let field: String
    public let code: String
    public let message: String?

}

public struct GitHubAPIErrorResponse: Decodable, Error {

    public let message: String
    public let errors: [GitHubApiError]

}
