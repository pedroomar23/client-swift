import Foundation

public struct LoginCode: Codable, Sendable {
    public let info: String
    public let notified: Bool
    public let has_otp: Bool

    enum CodingKeys: String, CodingKey {
        case info = "info"
        case notified = "notified"
        case has_otp = "has_otp"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try container.decode(String.self, forKey: .info)
        self.notified = try container.decode(Bool.self, forKey: .notified)
        self.has_otp = try container.decode(Bool.self, forKey: .has_otp)
    }

    public init(info: String, notified: Bool, has_otp: Bool) {
        self.info = info
        self.notified = notified
        self.has_otp = has_otp
    }
}

extension LoginCode: CustomStringConvertible {
    public var description: String {
        return "info: \(info), notified: \(notified), has_otp: \(has_otp)"
    }
}
