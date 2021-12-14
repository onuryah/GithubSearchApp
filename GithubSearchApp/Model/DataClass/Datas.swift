//
//  Datas.swift
//  GithubSearchApp
//
//  Created by Ceren Çapar on 30.11.2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let name: String
    let itemPrivate: Bool
    let language: Language?
    let forksCount: Int
    let watchersCount: Int
    let owner: Owner


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case itemPrivate = "private"
        case language = "language"
        case forksCount = "forks_count"
        case watchersCount = "watchers_count"
        case owner
    }
    
    enum Language: String, Codable {
        case dart = "Dart"
        case html = "HTML"
        case java = "Java"
        case javaScript = "JavaScript"
        case kotlin = "Kotlin"
        case php = "PHP"
        case python = "Python"
    }
}
// MARK: - Owner
struct Owner: Codable {
    let login: String
    let id: Int
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
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
