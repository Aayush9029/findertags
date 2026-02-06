import Foundation

struct TagRecord: Codable, Equatable {
    let path: String
    let tags: [String]
}

struct TagFrequency: Codable, Equatable {
    let tag: String
    let count: Int
}
