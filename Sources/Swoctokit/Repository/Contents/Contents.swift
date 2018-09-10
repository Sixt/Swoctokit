//
//  Contents.swift
//  Swoctokit
//
//  Created by franz busch on 09.09.18.
//

import Foundation

public struct Contents: Decodable {

    public enum ContentsType: String, Decodable {
        case file
        case dir
    }

    public let type: ContentsType
    public let size: Int
    public let name: String
    public let path: String
    public let sha: String
    public let url: String
    public let content: String

    public var decodedContent: String? {
        guard let data = Data(base64Encoded: content) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

}
