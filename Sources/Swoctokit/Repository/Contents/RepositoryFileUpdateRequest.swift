//
//  RepositoryFileUpdateRequest.swift
//  Swoctokit
//
//  Created by franz busch on 09.09.18.
//

import Foundation

struct RepositoryFileUpdateRequest: Encodable {

    let path: String
    let message: String
    let content: String
    let sha: String
    let branch: String

}
