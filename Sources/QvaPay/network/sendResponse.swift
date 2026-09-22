import Foundation
import os.log

class Response: @unchecked Sendable {
    static let shared = Response()
    let logger = Logger()
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration)
    }()

    func sendResponse<T: Codable>(
        router: Router,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) async throws {
        do {
            let (data, response) = try await session.data(for: router.urlRequest())

            if let jsonData = String(data: data, encoding: .utf8) {
                self.logger.debug("✅ DEBUG: SERVER RESPONSE SUCCESS \(jsonData)")
            } else {
                self.logger.error("❌ DEBUG: SERVER RESPONSE FAILURE")
            }

            if let httpResponse = response as? HTTPURLResponse {
                self.logger.debug("✅ DEBUG: STATUS CODE RESPONSE \(httpResponse.statusCode)")

                switch httpResponse.statusCode {
                    case 200:
                        let t = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(t))
                    case 400:
                        let errorDetails = String(data: data, encoding: .utf8)
                        self.logger.error("❌ DEBUG: SERVER RESPONSE FAILURE \(String(describing: errorDetails))")
                    case 500:
                        let errorDetails = String(data: data, encoding: .utf8)
                        self.logger.error("❌ DEBUG: SERVER RESPONSE FAILURE \(String(describing: errorDetails))")
                    default:
                        let errorDetails = String(data: data, encoding: .utf8)
                        self.logger.error("❌ DEBUG: SERVER RESPONSE FAILURE \(String(describing: errorDetails))")
                }
            }
        } catch {
            completion(.failure(error))
            self.logger.error("DEBUG: SERVER FAILURE RESPONSE \(error.localizedDescription)")
        }
    }
}
