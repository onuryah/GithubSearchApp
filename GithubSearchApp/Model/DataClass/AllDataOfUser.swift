

import Foundation



struct WelcomeElement: Codable {
   
    let name: String
    let welcomeDescription: String
    let createdAt: String
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


