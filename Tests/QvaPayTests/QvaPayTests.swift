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

    // MARK: - Coins

    func testCoins() throws {
        let jsonString = """
        [
          {
            "id": 1,
            "name": "Criptomonedas",
            "logo": "crypto",
            "Coins": [
              {
                "id": "6",
                "coins_categories_id": 1,
                "network": "TRON",
                "name": "USDT (TRC20)",
                "logo": "usdt",
                "tick": "USDT",
                "fee_in": "0.2",
                "fee_in_gold": "0",
                "fee_out": "1",
                "fee_out_gold": "0.8",
                "fee_out_fixed": [100, 1],
                "min_in": "1",
                "min_out": "2",
                "max_in": 1000000,
                "max_out": 5000,
                "working_data": [
                  {
                    "name": "Wallet",
                    "type": "text"
                  }
                ],
                "enabled_in": true,
                "enabled_out": true,
                "enabled_p2p": true,
                "auto_withdraw": true,
                "p2p_rate_discount": "0",
                "trade": false,
                "price": "1",
                "decimals": 2,
                "stable": true,
                "created_at": null,
                "updated_at": "2025-06-12T03:40:01.000Z",
                "description": "### ¿Qué es USDT (TRC20)? ...",
                "seo_title": "USDT TRC20 ✓ Compra y envía en QvaPay",
                "seo_description": "USDT TRC20 en QvaPay: stablecoin rápido y seguro..."
              }
            ]
          }
        ]
        """
        let jsonData = jsonString.data(using: .utf8)!
        let coins = try JSONDecoder().decode([CoinsResp].self, from: jsonData)
        print("✅ DEBUG: TEST JSON SUCCESS \(coins)")

        XCTAssertEqual(coins[0].id, 1)
        XCTAssertEqual(coins[0].name, "Criptomonedas")
        XCTAssertEqual(coins[0].logo, "crypto")
        XCTAssertEqual(coins[0].coins[0].id, "6")
        XCTAssertEqual(coins[0].coins[0].coins_categories_id, 1)
        XCTAssertEqual(coins[0].coins[0].network, "TRON")
        XCTAssertEqual(coins[0].coins[0].name, "USDT (TRC20)")
        XCTAssertEqual(coins[0].coins[0].logo, "usdt")
        XCTAssertEqual(coins[0].coins[0].tick, "USDT")
        XCTAssertEqual(coins[0].coins[0].fee_in, "0.2")
        XCTAssertEqual(coins[0].coins[0].fee_in_gold, "0")
        XCTAssertEqual(coins[0].coins[0].fee_out, "1")
        XCTAssertEqual(coins[0].coins[0].fee_out_gold, "0.8")
        XCTAssertEqual(coins[0].coins[0].fee_out_fixed, [100,1])
        XCTAssertEqual(coins[0].coins[0].min_in, "1")
        XCTAssertEqual(coins[0].coins[0].max_in, 1000000)
        XCTAssertEqual(coins[0].coins[0].max_out, 5000)
        XCTAssertEqual(coins[0].coins[0].working_data[0].name, "Wallet")
        XCTAssertEqual(coins[0].coins[0].working_data[0].type, "text")
        XCTAssertEqual(coins[0].coins[0].enabled_in, true)
        XCTAssertEqual(coins[0].coins[0].enabled_out, true)
        XCTAssertEqual(coins[0].coins[0].enabled_p2p, true)
        XCTAssertEqual(coins[0].coins[0].p2p_rate_discount, "0")
        XCTAssertEqual(coins[0].coins[0].trade, false)
        XCTAssertEqual(coins[0].coins[0].price, "1")
        XCTAssertEqual(coins[0].coins[0].decimals, 2)
        XCTAssertEqual(coins[0].coins[0].stable, true)
        XCTAssertEqual(coins[0].coins[0].created_at, nil)
        XCTAssertEqual(coins[0].coins[0].updated_at, "2025-06-12T03:40:01.000Z")
        XCTAssertEqual(coins[0].coins[0].description, "### ¿Qué es USDT (TRC20)? ...")
        XCTAssertEqual(coins[0].coins[0].seo_title, "USDT TRC20 ✓ Compra y envía en QvaPay")
        XCTAssertEqual(coins[0].coins[0].seo_description, "USDT TRC20 en QvaPay: stablecoin rápido y seguro...")
    }

    // MARK: - Tests Stocks

    func testStocks() throws {
        let jsonString = """
        [
          {
            "symbol": "AAPL",
            "name": "Apple",
            "icon": "apple",
            "iconStyle": "brand",
            "image": "https://www.qvapay.com/img/stocks/AAPL.svg",
            "price": 178.52,
            "change": 1.25,
            "changeDollar": 2.21,
            "volume": 54320100,
            "timestamp": "2025-03-17 15:30:00"
          },
          {
            "symbol": "GOOGL",
            "name": "Alphabet",
            "icon": "google",
            "iconStyle": "brand",
            "image": "https://www.qvapay.com/img/stocks/GOOGL.svg",
            "price": 141.80,
            "change": -0.45,
            "changeDollar": -0.64,
            "volume": 21540300,
            "timestamp": "2025-03-17 15:30:00"
          }
        ]
        """
        let jsonData = jsonString.data(using: .utf8)!
        let stoks = try JSONDecoder().decode([Stocks].self, from: jsonData)
        print("DEBUG: JSON SUCCESS RESPONSE: \(stoks)")

        XCTAssertEqual(stoks[0].symbol, "AAPL")
        XCTAssertEqual(stoks[0].name, "Apple")
        XCTAssertEqual(stoks[0].icon, "apple")
        XCTAssertEqual(stoks[0].iconStyle, "brand")
        XCTAssertEqual(stoks[0].image, "https://www.qvapay.com/img/stocks/AAPL.svg")
        XCTAssertEqual(stoks[0].price, 178.52)
        XCTAssertEqual(stoks[0].change, 1.25)
        XCTAssertEqual(stoks[0].changeDollar, 2.21)
        XCTAssertEqual(stoks[0].volume, 54320100)
        XCTAssertEqual(stoks[0].timestamp, "2025-03-17 15:30:00")
    }

    // MARK: - TEST Stock Buy

    func testStockBuy() throws {
        let jsonString = """
        {
          "success": true,
          "data": {
            "trade_uuid": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
            "transaction_uuid": "f0e1d2c3-b4a5-6789-0abc-def123456789",
            "symbol": "AAPL",
            "quantity": 0.279832,
            "effective_price": 178.68,
            "market_price": 178.25,
            "spread_percent": 0.24,
            "fee": 0.25,
            "total_debited": 50.25,
            "after_hours": false
          }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let stocks = try JSONDecoder().decode(StockResp.self, from: jsonData)
        print("DEBUG: JSON RESPONSE SUCCESS \(stocks)")

        XCTAssertEqual(stocks.success, true)
        XCTAssertEqual(stocks.data.trade_uuid, "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
        XCTAssertEqual(stocks.data.transaction_uuid, "f0e1d2c3-b4a5-6789-0abc-def123456789")
        XCTAssertEqual(stocks.data.symbol, "AAPL")
        XCTAssertEqual(stocks.data.quantity, 0.279832)
        XCTAssertEqual(stocks.data.effective_price, 178.68)
        XCTAssertEqual(stocks.data.market_price, 178.25)
        XCTAssertEqual(stocks.data.spread_percent, 0.24)
        XCTAssertEqual(stocks.data.fee, 0.25)
        XCTAssertEqual(stocks.data.total_debited, 50.25)
        XCTAssertEqual(stocks.data.after_hours, false)
    }
}
