//
//  RepositoryCreateRequest.swift
//  Swoctokit
//
//  Created by franz busch on 08.08.18.
//

import Vapor

struct RepositoryCreateRequest: Content {

    let name: String
    let description: String
    let `private` : Bool

}
