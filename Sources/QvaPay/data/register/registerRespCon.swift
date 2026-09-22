import Foundation

public struct RegisterRespCon: Codable, Sendable {
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
