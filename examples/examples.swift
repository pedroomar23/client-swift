// Examples in the ViewModel Use in a project in Xcode using MVVM arquitecture.
// This sdk is only use in projects with iOS 17 or later.

import Foundation
import SwiftUI
import Observation
import QvaPay

@Observable
class QvaPayRequest {
    // Call to the API
    let qvapay = QvaPayApi.shared

    // Register
    func register() async {
        await qvapay.login(
            name: "name",
            lastname: "lastname",
            email: "email",
            password: "password",
            invite: "invite",
            terms: "terms"
        ) { result in
            switch result {
                case let .success(model):
                    print("LOGIN RESPONSE: \(model)")
                case let .failure(error):
                    print("LOGIN FAILURE: \(error.localizedDescription)")
            }
        }
    }

    // Register Confirmation
    func registerConfirm() async {
        await qvapay.registerConfirm(
            uid: "uid",
            email: "email",
            pin: "pin"
        ) { result in
            switch result {
                case let .success(model):
                    print("REGISTER CONFIRM RESPONSE: \(model)")
                case let .failure(error):
                    print("REGISTER CONFIRM FAILURE: \(error.localizedDescription)")
            }
        }
    }

    // Login
    func loginRequest() async {
        await qvapay.login(
            email: "email",
            password: "password",
            remember: "remember",
            two_factor_code: "two_factor_code"
        ) { result in
            switch result {
                case let .success(model):
                    print("Login Success: \(model)")
                case let .failure(error):
                    print("LoginFailure: \(error.localizedDescription)")
            }
        }
    }
}
