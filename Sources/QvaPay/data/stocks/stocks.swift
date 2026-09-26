import Foundation

public struct Stocks: Codable, Sendable {
    public let symbol: String
    public let name: String
    public let icon: String
    public let iconStyle: String
    public let image: String
    public let price: Double
    public let change: Double
    public let changeDollar: Double
    public let volume: Int
    public let timestamp: String

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case icon = "icon"
        case iconStyle = "iconStyle"
        case image = "image"
        case price = "price"
        case change = "change"
        case changeDollar = "changeDollar"
        case volume = "volume"
        case timestamp = "timestamp"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.iconStyle = try container.decode(String.self, forKey: .iconStyle)
        self.image = try container.decode(String.self, forKey: .image)
        self.price = try container.decode(Double.self, forKey: .price)
        self.change = try container.decode(Double.self, forKey: .change)
        self.changeDollar = try container.decode(Double.self, forKey: .changeDollar)
        self.volume = try container.decode(Int.self, forKey: .volume)
        self.timestamp = try container.decode(String.self, forKey: .timestamp)
    }

    public init(symbol: String, name: String, icon: String, iconStyle: String, image: String, price: Double, change: Double, changeDollar: Double, volume: Int, timestamp: String) {
        self.symbol = symbol
        self.name = name
        self.icon = icon
        self.iconStyle = iconStyle
        self.image = image
        self.price = price
        self.change = change
        self.changeDollar = changeDollar
        self.volume = volume
        self.timestamp = timestamp
    }
}

extension Stocks: CustomStringConvertible {
    public var description: String {
        return "symbol: \(symbol), name: \(name), icon: \(icon), iconStyle: \(iconStyle), image: \(image), price: \(price), change: \(change), changeDollar: \(changeDollar), volume: \(volume), timestamp: \(timestamp)"
    }
}
