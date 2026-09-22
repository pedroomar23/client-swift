import XCTest
@testable import QvaPay

final class QvaPayTests: XCTestCase {

    // MARK: - TEST LOGIN REQUEST

    func testLoginRequest() throws {
        let jsonString = """
            {
                "email": "usuario@ejemplo.com",
                "password": "contraseña123",
                "remember": true,
                "two_factor_code": "1234"
          }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let login = try JSONDecoder().decode(LoginRequest.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(login)")

        XCTAssertEqual(login.email, "usuario@ejemplo.com")
        XCTAssertEqual(login.password, "contraseña123")
        XCTAssertEqual(login.remember, true)
        XCTAssertEqual(login.two_factor_code, "1234")
    }

    // MARK: - TEST REQUEST 2FA

    func testCode() throws {
        let jsonString = """
            {
              "info": "Código 2FA requerido",
              "notified": false,
              "has_otp": true
            }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let code = try JSONDecoder().decode(LoginCode.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(code)")

        XCTAssertEqual(code.info, "Código 2FA requerido")
        XCTAssertEqual(code.notified, false)
        XCTAssertEqual(code.has_otp, true)
    }

    // MARK: - TEST LOGIN AUTH

    func testLoginAuth() throws {
        let jsonString = """
        {
          "accessToken": "203955|abc123...",
          "token_type": "Bearer",
          "me": {
            "uuid": "550e8400-e29b-41d4-a716-446655440000",
            "email": "usuario@ejemplo.com",
            "name": "Juan",
            "username": "juan123",
            "balance": "150.75"
          }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let auth = try JSONDecoder().decode(LoginAuth.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(auth)")

        XCTAssertEqual(auth.accessToken, "203955|abc123...")
        XCTAssertEqual(auth.token_type, "Bearer")
        XCTAssertEqual(auth.me.uuid, "550e8400-e29b-41d4-a716-446655440000")
        XCTAssertEqual(auth.me.email, "usuario@ejemplo.com")
        XCTAssertEqual(auth.me.name, "Juan")
        XCTAssertEqual(auth.me.username, "juan123")
        XCTAssertEqual(auth.me.balance, "150.75")
    }

    // MARK: - TEST Register

    func testRegister() throws {
        let jsonString = """
        {
          "name": "Juan",
          "lastname": "Pérez",
          "email": "usuario@ejemplo.com",
          "password": "contraseña123",
          "invite": "username_invitador",
          "terms": true
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let register = try JSONDecoder().decode(RegisterRequest.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(register)")

        XCTAssertEqual(register.name, "Juan")
        XCTAssertEqual(register.lastname, "Pérez")
        XCTAssertEqual(register.email, "usuario@ejemplo.com")
        XCTAssertEqual(register.password, "contraseña123")
        XCTAssertEqual(register.invite, "username_invitador")
        XCTAssertEqual(register.terms, true)
    }

    // MARK: - TEST Register Response

    func testRegisterResp() throws {
        let jsonString = """
        {
          "message": "Registro exitoso",
          "user": {
            "uuid": "550e8400-e29b-41d4-a716-446655440000",
            "email": "usuario@ejemplo.com",
            "name": "Juan",
            "username": "juan123"
          }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let registerResp = try JSONDecoder().decode(RegisterResp.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(registerResp)")

        XCTAssertEqual(registerResp.message, "Registro exitoso")
        XCTAssertEqual(registerResp.user.uuid, "550e8400-e29b-41d4-a716-446655440000")
        XCTAssertEqual(registerResp.user.email, "usuario@ejemplo.com")
        XCTAssertEqual(registerResp.user.name, "Juan")
        XCTAssertEqual(registerResp.user.username, "juan123")
    }

    // MARK: - TEST Register Confirm

    func testRegisterConfirm() throws {
        let jsonString = """
        {
          "uuid": "550e8400-e29b-41d4-a716-446655440000",
          "email": "usuario@ejemplo.com",
          "pin": "1234"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let register = try JSONDecoder().decode(RegisterConfirm.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(register)")

        XCTAssertEqual(register.uuid, "550e8400-e29b-41d4-a716-446655440000")
        XCTAssertEqual(register.email, "usuario@ejemplo.com")
        XCTAssertEqual(register.pin, "1234")
    }

    // MARK: - Test Register Response Confirmation

    func testRegisterCon() throws {
        let jsonString = """
        {
          "message": "Registro confirmado"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let register = try JSONDecoder().decode(RegisterRespCon.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(register)")

        XCTAssertEqual(register.message, "Registro confirmado")
    }

    // MARK: - TEST Sessions

    func testSessions() throws {
        let jsonString = """
        {
          "sessions": [
            {
              "id": "12345",
              "name": "macOS Chrome - 192.168.1.1",
              "ip_address": "192.168.1.1",
              "user_agent": "Mozilla/5.0...",
              "created_at": "2024-01-15T10:30:00.000Z",
              "expires_at": "2024-07-15T10:30:00.000Z"
            }
          ],
          "currentSessionId": "12345"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let session = try JSONDecoder().decode(SessionsResp.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(session)")

        XCTAssertEqual(session.sessions.count, 1)
        XCTAssertEqual(session.sessions[0].id, "12345")
        XCTAssertEqual(session.sessions[0].name, "macOS Chrome - 192.168.1.1")
        XCTAssertEqual(session.sessions[0].ip_address, "192.168.1.1")
        XCTAssertEqual(session.sessions[0].user_agent, "Mozilla/5.0...")
        XCTAssertEqual(session.sessions[0].created_at, "2024-01-15T10:30:00.000Z")
        XCTAssertEqual(session.sessions[0].expires_at, "2024-07-15T10:30:00.000Z")
        XCTAssertEqual(session.currentSessionId, "12345")
    }
}
