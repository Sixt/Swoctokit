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
import Foundation

public class Swoctokit {

    private let application: Application
    private let client: Client

    public let repository: RepositoryService
    public let contents: RepositoryContentsService
    public let pullRequests: RepositoryPullRequestService
    public let checkRuns: RepositoryCommitsCheckRunsService
    public let teams: TeamsService

    public init(token: String, application: Application) throws {
        self.application = application
        self.client = try application.client()
        self.repository = RepositoryService(token: token, client: client)
        self.teams = TeamsService(token: token, client: client)
        self.contents = RepositoryContentsService(token: token, client: client)
        self.pullRequests = RepositoryPullRequestService(token: token, client: client)
        self.checkRuns = RepositoryCommitsCheckRunsService(token: token, client: client)
    }

}
