import Foundation

enum Router: Sendable {
    static let urlApi = "https://api.qvapay.com"

    case auth(params: String)
    case register(params: String)
    case registerConfirm(params: String)
    case sessions
    case requestPin(params: String)
    case coins

    private var url: URL {
        return URL(string: Router.urlApi + path)!
    }

    private var path: String {
        switch self {
            case .auth: return "/auth/login"
            case .register: return "/auth/register"
            case .registerConfirm: return "/auth/confirm-registration"
            case .sessions: return "/auth/sessions"
            case .requestPin: return "/auth/request-pin"
            case .coins: return "/coins"
        }
    }

    private var httpMethod: String {
        switch self {
            case .auth: return "POST"
            case .register: return "POST"
            case .registerConfirm: return "POST"
            case .sessions: return "GET"
            case .requestPin: return "POST"
            case .coins: return "GET"
        }
    }

    private var parameters: Data? {
        switch self {
            case .auth(let params): return params.data(using: .utf8)
            case .register(let params): return params.data(using: .utf8)
            case .registerConfirm(let params): return params.data(using: .utf8)
            case .sessions: return nil
            case .requestPin(let params): return params.data(using: .utf8)
            case .coins: return nil
        }
    }

    func urlRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Contet-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if let parameters = parameters {
            request.httpBody = parameters
        }
        return request
    }
}
