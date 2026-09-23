import Foundation

public struct RegisterConfirm: Codable, Sendable {
    public let uuid: String
    public let email: String
    public let pin: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case email = "email"
        case pin = "pin"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.email = try container.decode(String.self, forKey: .email)
        self.pin = try container.decode(String.self, forKey: .pin)
    }

    public init(uuid: String, email: String, pin: String) {
        self.uuid = uuid
        self.email = email
        self.pin = pin
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(email, forKey: .email)
        try container.encode(pin, forKey: .pin)
    }

    func jsonData() throws -> Data? {
        return try? JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        let data = try? jsonData()!
        return String(data: data!, encoding: encoding)
    }
}

extension RegisterConfirm: CustomStringConvertible {
    public var description: String {
        return "uuid: \(uuid), email: \(email), pin: \(pin)"
    }
}
