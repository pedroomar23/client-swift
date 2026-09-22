import Foundation

public struct RegisterRequest: Codable, Sendable {
    public var name: String
    public var lastname: String
    public var email: String
    public var password: String
    public var invite: String
    public var terms: Bool

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case lastname = "lastname"
        case email = "email"
        case password = "password"
        case invite = "invite"
        case terms = "terms"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.invite = try container.decode(String.self, forKey: .invite)
        self.terms = try container.decode(Bool.self, forKey: .terms)
    }

    public init(name: String, lastname: String, email: String, password: String, invite: String, terms: Bool) {
        self.name = name
        self.lastname = lastname
        self.email = email
        self.password = password
        self.invite = invite
        self.terms = terms
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(lastname, forKey: .lastname)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(invite, forKey: .invite)
        try container.encode(terms, forKey: .terms)
    }

    func jsonData() throws -> Data? {
        return try JSONEncoder().encode(self)
    }

    func jsonString() throws -> String {
        let data = try self.jsonData()!
        return String(data: data, encoding: .utf8)!
    }
}
