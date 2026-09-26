import Foundation

// MARK: - Stock Buy Request

public struct StockBuy: Codable, Sendable {
    public var amount: String

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
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

extension StockBuy: CustomStringConvertible {
    public var description: String {
        return "StockBuy(amount: \(amount))"
    }
}

// MARK: - Stock Buy Response

public struct StockResp: Codable, Sendable {
    public let success: Bool
    public let data: StockData

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.data = try container.decode(StockData.self, forKey: .data)
    }

    public init(success: Bool, data: StockData) {
        self.success = success
        self.data = data
    }
}

extension StockResp: CustomStringConvertible {
    public var description: String {
        return "success: \(success), data: \(data)"
    }
}

public struct StockData: Codable, Sendable {
    public let trade_uuid: String
    public let transaction_uuid: String
    public let symbol: String
    public let quantity: Double
    public let effective_price: Double
    public let market_price: Double
    public let spread_percent: Double
    public let fee: Double
    public let total_debited: Double
    public let after_hours: Bool

    enum CodingKeys: String, CodingKey {
        case trade_uuid = "trade_uuid"
        case transaction_uuid = "transaction_uuid"
        case symbol = "symbol"
        case quantity = "quantity"
        case effective_price = "effective_price"
        case market_price = "market_price"
        case spread_percent = "spread_percent"
        case fee = "fee"
        case total_debited = "total_debited"
        case after_hours = "after_hours"
    }


    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trade_uuid = try container.decode(String.self, forKey: .trade_uuid)
        self.transaction_uuid = try container.decode(String.self, forKey: .transaction_uuid)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.effective_price = try container.decode(Double.self, forKey: .effective_price)
        self.market_price = try container.decode(Double.self, forKey: .market_price)
        self.spread_percent = try container.decode(Double.self, forKey: .spread_percent)
        self.fee = try container.decode(Double.self, forKey: .fee)
        self.total_debited = try container.decode(Double.self, forKey: .total_debited)
        self.after_hours = try container.decode(Bool.self, forKey: .after_hours)
    }

    public init(trade_uuid: String, transaction_uuid: String, symbol: String, quantity: Double, effective_price: Double, market_price: Double, spread_percent: Double, fee: Double, total_debited: Double, after_hours: Bool) {
        self.trade_uuid = trade_uuid
        self.transaction_uuid = transaction_uuid
        self.symbol = symbol
        self.quantity = quantity
        self.effective_price = effective_price
        self.market_price = market_price
        self.spread_percent = spread_percent
        self.fee = fee
        self.total_debited = total_debited
        self.after_hours = after_hours
    }
}
