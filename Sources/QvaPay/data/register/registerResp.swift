import Foundation

public struct RegisterResp: Codable, Sendable {
    public let message: String
    public let user: User

    enum CodingKeys: String, CodingKey {
        case message
        case user
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.user = try container.decode(User.self, forKey: .user)
    }

    public init(message: String, user: User) {
        self.message = message
        self.user = user
    }
}

public struct User: Codable, Sendable {
    public let uuid: String
    public let email: String
    public let name: String
    public let username: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case email = "email"
        case name = "name"
        case username = "username"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
    }

    public init(uuid: String, email: String, name: String, username: String) {
        self.uuid = uuid
        self.email = email
        self.name = name
        self.username = username
    }
}
