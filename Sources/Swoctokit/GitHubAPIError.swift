//
//  GitHubAPIError.swift
//  Swoctokit
//
//  Created by franz busch on 08.08.18.
//

import Vapor

struct GitHubApiError: Content {

    let resource: String
    let field: String
    let code: String

}

struct GitHubAPIErrorResponse: Content, Error {

    let message: String
    let errors: [GitHubApiError]

}
