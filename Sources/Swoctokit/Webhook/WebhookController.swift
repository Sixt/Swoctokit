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

final class WebhookController: RouteCollection {


    func boot(router: Router) throws {
        let route = router.grouped("webhooks")
        route.post("", use: postHandler)
    }

    func postHandler(_ req: Request) throws -> HTTPStatus {
        print(req.http.headers["X-GitHub-Event"])

        return .ok
    }

}
