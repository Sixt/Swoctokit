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

import Vapor

public class RepositoryBranchesBranchService {

    private let token: String
    private let client: Client

    init(token: String, client: Client) {
        self.token = token
        self.client = client
    }

    public func getBranch(owner: String, repository: String, branch: String) -> Future<Branch> {
        let url = "\(Constants.GitHubBaseURL)/repos/\(owner)/\(repository)/branches/\(branch)"
        let headers = HTTPHeaders([
            ("Authorization", "token \(token)")
        ])
        return client.get(url, headers: headers).flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return try response.content.decode(json: Branch.self, using: .convertFromSnakeCase)
        }
    }

}

