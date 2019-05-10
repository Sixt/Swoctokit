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

public class RepositoryCommitsCheckRunsService {

    private let token: String
    private let client: Client

    init(token: String, client: Client) {
        self.token = token
        self.client = client
    }

    public func getCheckRuns(owner: String, repository: String, ref: String) -> Future<[CheckRun]> {
        let url = "\(Constants.GitHubBaseURL)/repos/\(owner)/\(repository)/commits/\(ref)/check-runs"
        let headers = HTTPHeaders([
            ("Authorization", "token \(token)"),
            ("Accept", "application/vnd.github.antiope-preview+json")
        ])
        return client.get(url, headers: headers).flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return try response.content
                .decode(json: CheckRunsResponse.self, using: .convertFromSnakeCase)
                .map { $0.checkRuns }
        }
    }

}

struct CheckRunsResponse: Decodable {
    let totalCount: Int
    let checkRuns: [CheckRun]
}
