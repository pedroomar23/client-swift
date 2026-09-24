# 🚀 QvaPay SDK Documentation

## 📚 Introduction
The QvaPay SDK is a set of tools and libraries that enable developers to integrate QvaPay payment processing into their applications. This documentation provides a comprehensive overview of the SDK's features, functionalities, and usage instructions.

## 🚀 SDK Use 
This sdk is used with MMVM arquitecture. 

## 📱 URL API 
```bash
https://api.qpapay.com
```

## 🌐 Import SDK 
```swift 
import QvaPay 
```

## 🌐 Call to the QvaPay API 
```swift 
let qvapay = QvaPayApi.shared 
```

### 👨‍💻 Register 
```swift 
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
```

### 👨‍💻 Register Confirmation 
```swift 
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
```

### 👨‍💻 Login 
```swift 
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
```
