//
//  AllDataOfUser.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 17.12.2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

// MARK: - WelcomeElement
struct RepositoriesArray {
    let repositoryArray : [WelcomeElement]
    
    enum CodingKeys: String, CodingKey {
        case repositoryArray
    }
}
struct WelcomeElement: Codable {
   
    let name: String
    let welcomeDescription: String
    let createdAt: Date
    let language: Language?
    let watchers: Int

    enum CodingKeys: String, CodingKey {
        case name
        case welcomeDescription = "description"
        case createdAt = "created_at"
        case language
        case watchers
    }
    
    enum Language: String, Codable {
        case groovy = "Groovy"
        case java = "Java"
        case javaScript = "JavaScript"
        case kotlin = "Kotlin"
        case shell = "Shell"
    }
}
// MARK: - Encode/decode helpers

class JSONNullTwo: Codable, Hashable {

    public static func == (lhs: JSONNullTwo, rhs: JSONNullTwo) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

