import Foundation

// MARK: - Request Pin Request

public struct RequestPin: Codable, Sendable {
    public var username: String
    public var password: String

    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
    }

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }

    func jsonData() throws -> Data? {
        return try? JSONEncoder().encode(self)
    }

    func jsonString(enconding: String.Encoding = .utf8) throws -> String? {
        let data = try? self.jsonData()!
        return String(data: data!, encoding: enconding)
    }
}

extension RequestPin: CustomStringConvertible {
    public var description: String {
        return "username: \(username), password: \(password)"
    }
}

// MARK: - Request Pin Response

public struct RequestPinResp: Codable, Sendable {
    public let message: String

    enum CodingKeys: String, CodingKey {
        case message = "message"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
    }

    public init(message: String) {
        self.message = message
    }
}

extension RequestPinResp: CustomStringConvertible {
    public var description: String {
        return "message: \(message)"
    }
}
