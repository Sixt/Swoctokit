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

public class RepositoryPullRequestService {

    private let token: String
    private let client: Client

    init(token: String, client: Client) {
        self.token = token
        self.client = client
    }

    public func getPullRequest(owner: String, repository: String, number: Int) -> Future<PullRequest> {
        let url = "\(Constants.GitHubBaseURL)/repos/\(owner)/\(repository)/pulls/\(number)"

        return client.get(url, headers: HTTPHeaders([("Authorization", "token \(token)")])).flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return try response.content.decode(json: PullRequest.self, using: .convertFromSnakeCase)
        }
    }

}
