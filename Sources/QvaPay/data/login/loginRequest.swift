import Foundation

public struct LoginRequest: Codable, Sendable {
    public var email: String
    public var password: String
    public var remember: Bool
    public var two_factor_code: String

    public enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
        case remember = "remember"
        case two_factor_code = "two_factor_code"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        remember = try container.decode(Bool.self, forKey: .remember)
        two_factor_code = try container.decode(String.self, forKey: .two_factor_code)
    }

    public init(email: String, password: String, remember: Bool, two_factor_code: String) {
        self.email = email
        self.password = password
        self.remember = remember
        self.two_factor_code = two_factor_code
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(remember, forKey: .remember)
        try container.encode(two_factor_code, forKey: .two_factor_code)
    }

    func jsonData() throws -> Data? {
        return try JSONEncoder().encode(self)
    }

    func jsonString() throws -> String? {
        let data = try self.jsonData()!
        return String(data: data, encoding: .utf8)
    }
}
