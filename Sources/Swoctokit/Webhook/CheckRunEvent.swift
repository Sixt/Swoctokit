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

public struct CheckRunEvent: Decodable, WebhookEvent {

    public let action: String
    public let checkRun: CheckRun

}
