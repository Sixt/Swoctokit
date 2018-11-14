//
//  Owner.swift
//  Swoctokit
//
//  Created by Franz Busch on 14.11.18.
//

import Foundation


public struct Owner: Decodable {

    public let login: String
    public let id: Int
    public let nodeId: String

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
    }

}
