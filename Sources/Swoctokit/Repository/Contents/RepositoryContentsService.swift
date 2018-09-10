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

public class RepositoryContentsService {

    private let token: String
    private let client: Client

    init(token: String, client: Client) {
        self.token = token
        self.client = client
    }

    public func getContents(organization: String, repository: String, path: String, ref: String? = nil) -> Future<Contents> {
        var url = "\(Constants.GitHubBaseURL)/repos/\(organization)/\(repository)/contents/\(path)"
        if let ref = ref {
            url = "\(url)?ref=\(ref)"
        }

        return client.get(url, headers: HTTPHeaders([("Authorization", "token \(token)")])).flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return try response.content.decode(Contents.self)
        }
    }

    public func updateFile(organization: String, repository: String, path: String, message: String, content: String, sha: String, branch: String) -> Future<Response> {
        let url = "\(Constants.GitHubBaseURL)/repos/\(organization)/\(repository)/contents/\(path)"
        let content = content.data(using: .utf8)!.base64EncodedString()
        let request = RepositoryFileUpdateRequest(path: path, message: message, content: content, sha: sha, branch: branch)

        return client.put(url, headers: HTTPHeaders([("Authorization", "token \(token)")])) { putRequest in
            try putRequest.content.encode(json: request)
        }.flatMap { response in
            if let error = try? response.content.syncDecode(GitHubAPIErrorResponse.self) {
                throw error
            }

            return response.eventLoop.future(response)
        }
    }

}
