import Foundation

public struct SessionsResp: Codable, Sendable {
    public let sessions: [Sessions]
    public let currentSessionId: String

    enum CodingKeys: String, CodingKey {
        case sessions = "sessions"
        case currentSessionId = "currentSessionId"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessions = try container.decode([Sessions].self, forKey: .sessions)
        currentSessionId = try container.decode(String.self, forKey: .currentSessionId)
    }

    public init(sessions: [Sessions], currentSessionId: String) {
        self.sessions = sessions
        self.currentSessionId = currentSessionId
    }
}


public struct Sessions: Codable, Sendable {
    public let id: String
    public let name: String
    public let ip_address: String
    public let user_agent: String
    public let created_at: String
    public let expires_at: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case ip_address = "ip_address"
        case user_agent = "user_agent"
        case created_at = "created_at"
        case expires_at = "expires_at"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.ip_address = try container.decode(String.self, forKey: .ip_address)
        self.user_agent = try container.decode(String.self, forKey: .user_agent)
        self.created_at = try container.decode(String.self, forKey: .created_at)
        self.expires_at = try container.decode(String.self, forKey: .expires_at)
    }

    public init(id: String, name: String, ip_address: String, user_agent: String, created_at: String, expires_at: String) {
        self.id = id
        self.name = name
        self.ip_address = ip_address
        self.user_agent = user_agent
        self.created_at = created_at
        self.expires_at = expires_at
    }
}
