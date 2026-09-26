import Foundation

public struct PortafolioResp: Codable, Sendable {
    public let success: Bool
    public let data: AllData

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.data = try container.decode(AllData.self, forKey: .data)
    }

    public init(success: Bool, data: AllData) {
        self.success = success
        self.data = data
    }
}

extension PortafolioResp: CustomStringConvertible {
    public var description: String {
        return "success: \(success), data: \(data)"
    }
}

// MARK: AllData

public struct AllData: Codable, Sendable {
    public let positions: [Position]
    public let summary: Summary
    public let trades: [Trades]
    public let pagination: Pagination

    enum CodingKeys: String, CodingKey {
        case positions = "positions"
        case summary = "summary"
        case trades = "trades"
        case pagination = "pagination"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.positions = try container.decode([Position].self, forKey: .positions)
        self.summary = try container.decode(Summary.self, forKey: .summary)
        self.trades = try container.decode([Trades].self, forKey: .trades)
        self.pagination = try container.decode(Pagination.self, forKey: .pagination)
    }


    public init(positions: [Position], summary: Summary, trades: [Trades], pagination: Pagination) {
        self.positions = positions
        self.summary = summary
        self.trades = trades
        self.pagination = pagination
    }
}

// MARK: - Position

public struct Position: Codable, Sendable {
    public let id: String
    public let symbol: String
    public let quantity: Double
    public let avg_cost: Double
    public let current_price: Double
    public let market_value: Double
    public let cost_basis: Double
    public let unrealized_pnl: Double
    public let unrealized_pnl_percent: Double

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case quantity = "quantity"
        case avg_cost = "avg_cost"
        case current_price = "current_price"
        case market_value = "market_value"
        case cost_basis = "cost_basis"
        case unrealized_pnl = "unrealized_pnl"
        case unrealized_pnl_percent = "unrealized_pnl_percent"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.avg_cost = try container.decode(Double.self, forKey: .avg_cost)
        self.current_price = try container.decode(Double.self, forKey: .current_price)
        self.market_value = try container.decode(Double.self, forKey: .market_value)
        self.cost_basis = try container.decode(Double.self, forKey: .cost_basis)
        self.unrealized_pnl = try container.decode(Double.self, forKey: .unrealized_pnl)
        self.unrealized_pnl_percent = try container.decode(Double.self, forKey: .unrealized_pnl_percent)
    }

    public init(id: String, symbol: String, quantity: Double, avg_cost: Double, current_price: Double, market_value: Double, cost_basis: Double, unrealized_pnl: Double, unrealized_pnl_percent: Double) {
        self.id = id
        self.symbol = symbol
        self.quantity = quantity
        self.avg_cost = avg_cost
        self.current_price = current_price
        self.market_value = market_value
        self.cost_basis = cost_basis
        self.unrealized_pnl = unrealized_pnl
        self.unrealized_pnl_percent = unrealized_pnl_percent
    }
}

// MARK: - Summary

public struct Summary: Codable, Sendable {
    public let total_market_value: Double
    public let total_cost_basis: Double
    public let total_unrealized_pnl: Double
    public let total_unrealized_pnl_percent: Double
    public let market_open: Bool

    enum CodingKeys: String, CodingKey {
        case total_market_value = "total_market_value"
        case total_cost_basis = "total_cost_basis"
        case total_unrealized_pnl = "total_unrealized_pnl"
        case total_unrealized_pnl_percent = "total_unrealized_pnl_percent"
        case market_open = "market_open"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total_market_value = try container.decode(Double.self, forKey: .total_market_value)
        self.total_cost_basis = try container.decode(Double.self, forKey: .total_cost_basis)
        self.total_unrealized_pnl = try container.decode(Double.self, forKey: .total_unrealized_pnl)
        self.total_unrealized_pnl_percent = try container.decode(Double.self, forKey: .total_unrealized_pnl_percent)
        self.market_open = try container.decode(Bool.self, forKey: .market_open)
    }

    public init(total_market_value: Double, total_cost_basis: Double, total_unrealized_pnl: Double, total_unrealized_pnl_percent: Double, market_open: Bool) {
        self.total_market_value = total_market_value
        self.total_cost_basis = total_cost_basis
        self.total_unrealized_pnl = total_unrealized_pnl
        self.total_unrealized_pnl_percent = total_unrealized_pnl_percent
        self.market_open = market_open
    }
}

// MARK: - Trades

public struct Trades: Codable, Sendable {
    public let id: String
    public let uuid: String
    public let symbol: String
    public let type: String
    public let quantity: Double
    public let market_price: Double
    public let effective_price: Double
    public let spread_percent: Double
    public let fee_amount: Double
    public let total_amount: Double
    public let realized_pnl: Double?
    public let after_hours: Bool
    public let created_at: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case uuid = "uuid"
        case symbol = "symbol"
        case type = "type"
        case quantity = "quantity"
        case market_price = "market_price"
        case effective_price = "effective_price"
        case spread_percent = "spread_percent"
        case fee_amount = "fee_amount"
        case total_amount = "total_amount"
        case realized_pnl = "realized_pnl"
        case after_hours = "after_hours"
        case created_at = "created_at"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.type = try container.decode(String.self, forKey: .type)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.market_price = try container.decode(Double.self, forKey: .market_price)
        self.effective_price = try container.decode(Double.self, forKey: .effective_price)
        self.spread_percent = try container.decode(Double.self, forKey: .spread_percent)
        self.fee_amount = try container.decode(Double.self, forKey: .fee_amount)
        self.total_amount = try container.decode(Double.self, forKey: .total_amount)
        self.realized_pnl = try container.decodeIfPresent(Double.self, forKey: .realized_pnl)
        self.after_hours = try container.decode(Bool.self, forKey: .after_hours)
        self.created_at = try container.decode(String.self, forKey: .created_at)
    }

    public init(id: String, uuid: String, symbol: String, type: String, quantity: Double, market_price: Double, effective_price: Double, spread_percent: Double, fee_amount: Double, total_amount: Double, realized_pnl: Double? = nil, after_hours: Bool = false, created_at: String) {
        self.id = id
        self.uuid = uuid
        self.symbol = symbol
        self.type = type
        self.quantity = quantity
        self.market_price = market_price
        self.effective_price = effective_price
        self.spread_percent = spread_percent
        self.fee_amount = fee_amount
        self.total_amount = total_amount
        self.realized_pnl = realized_pnl
        self.after_hours = after_hours
        self.created_at = created_at
    }
}

// MARK: - Pagination

public struct Pagination: Codable, Sendable {
    public let page: Int
    public let take: Int

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case take = "take"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.take = try container.decode(Int.self, forKey: .take)
    }

    public init(page: Int, take: Int) {
        self.page = page
        self.take = take
    }
}
