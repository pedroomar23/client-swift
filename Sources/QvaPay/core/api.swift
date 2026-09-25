import Foundation
import os.log

public class QvaPayApi: @unchecked Sendable {
    public static let shared = QvaPayApi()
    let logger = Logger()
    let response = Response.shared

    // MARK: - Register

    public func register(
        name: String,
        lastname: String,
        email: String,
        password: String,
        invite: String,
        terms: Bool,
        completion: @escaping (Result<RegisterResp, Error>) -> Void
    ) async {
       let params = try? RegisterRequest(
           name: name,
           lastname: lastname,
           email: email,
           password: password,
           invite: invite,
           terms: terms
       ).jsonString()!
       self.logger.debug("✅ DEBUG: JSON REEQUEST SUCCESS \(params!)")

       try? await response.sendResponse(
           router: Router.register(params: params!),
           type: RegisterResp.self
       ) { result in
           switch result {
               case let .success(model):
                    completion(.success(model))
                    self.logger.debug("✅ DEBUG: JSON RESPONSE SUCCESS \(model)")
               case let .failure(error):
                    completion(.failure(error))
                    self.logger.error("❌ DEBUG: JSON RESPONSE FAILURE \(error.localizedDescription)")
           }
       }
    }

    // MARK: - Register Confirmation

    public func registerConfirm(
        uuid: String,
        email: String,
        pin: String,
        completion: @escaping (Result<RegisterRespCon, Error>) -> Void
    ) async {
        let params = try? RegisterConfirm(
            uuid: uuid,
            email: email,
            pin: pin
        ).jsonString()!
        self.logger.debug("✅ DEBUG: JSON REQUEST SUCCESS \(params!)")

        try? await response.sendResponse(
            router: Router.registerConfirm(params: params!),
            type: RegisterRespCon.self
        ) { result in
            switch result {
                case let .success(model):
                    completion(.success(model))
                    self.logger.debug("✅ DEBUG: JSON RESPONSE SUCCESS \(model)")
                case let .failure(error):
                    completion(.failure(error))
                    self.logger.error("❌ DEBUG: JSON RESPONSE FAILURE \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Login

    public func login(
        email: String,
        password: String,
        remember: Bool,
        two_factor_code: String,
        completion: @escaping (Result<LoginAuth, Error>) -> Void
    ) async {
        let params = try? LoginRequest(
            email: email,
            password: password,
            remember: remember,
            two_factor_code: two_factor_code
        ).jsonString()!
        self.logger.debug("✅ DEBUG: JSON REQUEST SUCCESS \(params!)")

        try? await response.sendResponse(
            router: Router.auth(params: params!),
            type: LoginAuth.self
        ) { result in
            switch result {
                case let .success(model):
                    completion(.success(model))
                    self.logger.debug("✅ DEBUG: JSON RESPONSE SUCCESS \(model)")
                case let .failure(error):
                    completion(.failure(error))
                    self.logger.error("❌ DEBUG: JSON RESPONSE FAILURE \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Coins

    public func coins(
        completion: @escaping (Result<[CoinsResp], Error>) -> Void
    ) async {
        try? await response.sendResponse(
            router: Router.coins,
            type: [CoinsResp].self
        ) { result in
            switch result {
                case let .success(model):
                    completion(.success(model))
                    self.logger.debug("✅ DEBUG: JSON RESPONSE SUCCESS \(model)")
                case let .failure(error):
                    completion(.failure(error))
                    self.logger.error("❌ DEBUG: JSON RESPONSE FAILURE \(error.localizedDescription)")
            }
        }
    }

    // MARK: -
}
