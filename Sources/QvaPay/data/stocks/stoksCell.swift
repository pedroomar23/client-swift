import Foundation

public struct StockWith: Codable, Sendable {
    public var amount: String

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amount = try container.decode(String.self, forKey: .amount)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
    }

    public init(amount: String) {
        self.amount = amount
    }

    func jsonData() throws -> Data? {
        return try? JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        let data = try? self.jsonData()
        return String(data: data!, encoding: encoding)
    }
}

extension StockWith: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "amount: \(amount)"
    }
}
