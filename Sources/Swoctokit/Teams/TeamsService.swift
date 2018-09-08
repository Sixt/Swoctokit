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

public class TeamsService {

    private let token: String
    private let client: Client

    init(token: String, client: Client) {
        self.token = token
        self.client = client
    }

    public func addOrUpdateRepository(organization: String, teamId: String, repository: String, permission: RepositoryPermission? = nil) -> Future<Response> {
        let request = TeamsAddOrUpdateRepositoryRequest(permission: permission)
        let url = "\(Constants.GitHubBaseURL)/teams/\(teamId)/repos/\(organization)/\(repository)"
        return client.put(url, headers: HTTPHeaders([("Authorization", "token \(token)")])) { postRequest in
            try postRequest.content.encode(json: request)
        }.flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return response.eventLoop.future(response)
        }
    }

}
