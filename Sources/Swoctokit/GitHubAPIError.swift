//
//  GitHubAPIError.swift
//  Swoctokit
//
//  Created by franz busch on 08.08.18.
//

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
