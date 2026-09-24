<p align="center">
    <h1 align="center">
        QvaPay
    </h1>
</p>
<p align="center">
    <a href=""<img src="https://img.shields.io/badge/release 1.0.0-blue.svg" alt="release 1.0.0" /></a>
    <img src="https://img.shields.io/badge/Swift-6.3-orange.svg" alt="Swift 6.3" />
    <a href="https://www.qvapay.com/docs"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="[https://github.com/pedroomar23/client-swift/blob/main/License.md](https://github.com/pedroomar23/client-swift/blob/main/License.md)"><img src="https://img.shields.io/github/license/danielsaidi/SwiftUIKit" alt="MIT License" /></a>
</p>

# 📱 Description 
`QvaPay` is a sdk write in Swift that work with the [QvaPay Api](https://qvapay.com/docs).

# 📦 Installation 

```swift
dependencies: [
    .package(url: "https://github.com/qvapay/client-swift.git", from: "1.0.0")
]
```

# 🚀 Information 
```bash
QvaPay 
```

# 📱 Import in the Project
```swift 
import QvaPay 
```

## 🌐 Call to the API
```swift 
let shared = QvaPayApi.shared 
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

## 🧰 Used Arquitect 
- [x] ✅ Swift 6.4
- [x] ✅ URLSession 
- [x] ✅ Singlenton Patron 

## 📚 SDK Docomentation
This sdk is documentated on [docs](https://github.com/pedroomar23/client-swift/blob/main/docs/docs.md)

## 📚 Examples using the MVVM Arquitecture 
I use the sdk with MVVM Arquitecture with [examples](https://github.com/pedroomar23/client-swift/blob/main/examples/examples.swift) in a ViewModel for the developer that work in the QvaPay project in Swift could be more easy. This sdk include Models, API and tests JSON. The developer will be create the ViewModel and Views in Xcode. 

## 👨‍💻 Developed by Pedro Omar 
- 📩 Email: https://pocl9812@gmail.com
- 📞 WhatsApp: https://wa.me/pedroomar1998
- 📱 Telegram: https://t.me/pedroomar23

## 📝 License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/pedroomar23/client-swift/blob/main/LICENSE) file for more information. 

## 🚀 Contributions 
Contributions are welcome! Please feel free to open an issue or submit a pull request. 

------

This project was created by Pedro Omar and is available under the MIT License. Feel free to use it in your projects. If you have any questions or need further assistance, feel free to contact me.
