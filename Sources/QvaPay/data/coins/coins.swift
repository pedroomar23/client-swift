import Foundation

// MARK: - Coins Response

public struct CoinsResp: Codable, Sendable {
    public let id: Int
    public let name: String
    public let logo: String
    public let coins: [Coins]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case logo = "logo"
        case coins = "Coins"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.coins = try container.decode([Coins].self, forKey: .coins)
    }

    public init(id: Int, name: String, logo: String, coins: [Coins]) {
        self.id = id
        self.name = name
        self.logo = logo
        self.coins = coins
    }
}

extension CoinsResp: CustomStringConvertible {
    public var description: String {
        return "id: \(id), name: \(name), logo: \(logo), coins: \(coins)"
    }
}

// MARK: - Coins

public struct Coins: Codable, Sendable {
    public let id: String
    public let coins_categories_id: Int
    public let network: String
    public let name: String
    public let logo: String
    public let tick: String
    public let fee_in: String
    public let fee_in_gold: String
    public let fee_out: String
    public let fee_out_gold: String
    public let fee_out_fixed: [Double]
    public let min_in: String
    public let min_out: String
    public let max_in: Int
    public let max_out: Int
    public let working_data: [WorkData]
    public let enabled_in: Bool
    public let enabled_out: Bool
    public let enabled_p2p: Bool
    public let auto_withdraw: Bool
    public let p2p_rate_discount: String
    public let trade: Bool
    public let price: String
    public let decimals: Int
    public let stable: Bool
    public let created_at: String?
    public let updated_at: String
    public let description: String
    public let seo_title: String
    public let seo_description: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case coins_categories_id = "coins_categories_id"
        case network = "network"
        case name = "name"
        case logo = "logo"
        case tick = "tick"
        case fee_in = "fee_in"
        case fee_in_gold = "fee_in_gold"
        case fee_out = "fee_out"
        case fee_out_gold = "fee_out_gold"
        case fee_out_fixed = "fee_out_fixed"
        case min_in = "min_in"
        case min_out = "min_out"
        case max_in = "max_in"
        case max_out = "max_out"
        case working_data = "working_data"
        case enabled_in = "enabled_in"
        case enabled_out = "enabled_out"
        case enabled_p2p = "enabled_p2p"
        case auto_withdraw = "auto_withdraw"
        case p2p_rate_discount = "p2p_rate_discount"
        case trade = "trade"
        case price = "price"
        case decimals = "decimals"
        case stable = "stable"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case description = "description"
        case seo_title = "seo_title"
        case seo_description = "seo_description"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.coins_categories_id = try container.decode(Int.self, forKey: .coins_categories_id)
        self.network = try container.decode(String.self, forKey: .network)
        self.name = try container.decode(String.self, forKey: .name)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.tick = try container.decode(String.self, forKey: .tick)
        self.fee_in = try container.decode(String.self, forKey: .fee_in)
        self.fee_in_gold = try container.decode(String.self, forKey: .fee_in_gold)
        self.fee_out = try container.decode(String.self, forKey: .fee_out)
        self.fee_out_gold = try container.decode(String.self, forKey: .fee_out_gold)
        self.fee_out_fixed = try container.decode([Double].self, forKey: .fee_out_fixed)
        self.min_in = try container.decode(String.self, forKey: .min_in)
        self.min_out = try container.decode(String.self, forKey: .min_out)
        self.max_in = try container.decode(Int.self, forKey: .max_in)
        self.max_out = try container.decode(Int.self, forKey: .max_out)
        self.working_data = try container.decode([WorkData].self, forKey: .working_data)
        self.enabled_in = try container.decode(Bool.self, forKey: .enabled_in)
        self.enabled_out = try container.decode(Bool.self, forKey: .enabled_out)
        self.enabled_p2p = try container.decode(Bool.self, forKey: .enabled_p2p)
        self.auto_withdraw = try container.decode(Bool.self, forKey: .auto_withdraw)
        self.p2p_rate_discount = try container.decode(String.self, forKey: .p2p_rate_discount)
        self.trade = try container.decode(Bool.self, forKey: .trade)
        self.price = try container.decode(String.self, forKey: .price)
        self.decimals = try container.decode(Int.self, forKey: .decimals)
        self.stable = try container.decode(Bool.self, forKey: .stable)
        self.created_at = try container.decode(String?.self, forKey: .created_at)
        self.updated_at = try container.decode(String.self, forKey: .updated_at)
        self.description = try container.decode(String.self, forKey: .description)
        self.seo_title = try container.decode(String.self, forKey: .seo_title)
        self.seo_description = try container.decode(String.self, forKey: .seo_description)
    }

    public init(id: String, coins_categories_id: Int, network: String, name: String, logo: String, tick: String, fee_in: String, fee_in_gold: String, fee_out: String, fee_out_gold: String, fee_out_fixed: [Double], min_in: String, min_out: String, max_in: Int, max_out: Int, working_data: [WorkData], enabled_in: Bool, enabled_out: Bool, enabled_p2p: Bool, auto_withdraw: Bool, p2p_rate_discount: String, trade: Bool, price: String, decimals: Int, stable: Bool, created_at: String?, updated_at: String, description: String, seo_title: String, seo_description: String) {
        self.id = id
        self.coins_categories_id = coins_categories_id
        self.network = network
        self.name = name
        self.logo = logo
        self.tick = tick
        self.fee_in = fee_in
        self.fee_in_gold = fee_in_gold
        self.fee_out = fee_out
        self.fee_out_gold = fee_out_gold
        self.fee_out_fixed = fee_out_fixed
        self.min_in = min_in
        self.min_out = min_out
        self.max_in = max_in
        self.max_out = max_out
        self.working_data = working_data
        self.enabled_in = enabled_in
        self.enabled_out = enabled_out
        self.enabled_p2p = enabled_p2p
        self.auto_withdraw = auto_withdraw
        self.p2p_rate_discount = p2p_rate_discount
        self.trade = trade
        self.price = price
        self.decimals = decimals
        self.stable = stable
        self.created_at = created_at
        self.updated_at = updated_at
        self.description = description
        self.seo_title = seo_title
        self.seo_description = seo_description
    }
}


// MARK: - Working_Data

public struct WorkData: Codable, Sendable {
    public let name: String
    public let type: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
    }

    public init(name: String, type: String) {
        self.name = name
        self.type = type
    }
}
