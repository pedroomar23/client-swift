import Foundation

public struct LoginAuth: Codable, Sendable {
    public let accessToken: String
    public let token_type: String
    public let me: ME

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case token_type = "token_type"
        case me = "me"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.token_type = try container.decode(String.self, forKey: .token_type)
        self.me = try container.decode(ME.self, forKey: .me)
    }

    public init(accessToken: String, token_type: String, me: ME) {
        self.accessToken = accessToken
        self.token_type = token_type
        self.me = me
    }
}

extension LoginAuth: CustomStringConvertible {
    public var description: String {
        return "accessToken: \(accessToken), token_type: \(token_type), me: \(me)"
    }
}

public struct ME: Codable, Sendable {
    public let uuid: String
    public let email: String
    public let name: String
    public let username: String
    public let balance: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case email = "email"
        case name = "name"
        case username = "username"
        case balance = "balance"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.balance = try container.decode(String.self, forKey: .balance)
    }

    public init(uuid: String, email: String, name: String, username: String, balance: String) {
        self.uuid = uuid
        self.email = email
        self.name = name
        self.username = username
        self.balance = balance
    }
}

extension ME: CustomStringConvertible {
    public var description: String {
        return "uuid: \(uuid), email: \(email), name: \(name), username: \(username), balance: \(balance)"
    }
}
