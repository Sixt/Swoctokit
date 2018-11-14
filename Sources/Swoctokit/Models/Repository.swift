//
//  Repository.swift
//  Swoctokit
//
//  Created by Franz Busch on 14.11.18.
//

import Foundation

public struct Repository: Decodable {

    public let id: Int
    public let nodeId: String
    public let name: String
    public let fullName: String
    public let owner: Owner

    private enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case owner
    }
}
