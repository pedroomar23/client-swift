//
//  QvaPayApp.swift
//  QvaPay
//
//  Created by Pedro Omar  on 9/25/26.
//

import SwiftUI

@main
struct QvaPayApp: App {
    @State private var qvapayRequest = QvaPayRequest()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(qvapayRequest)
        }
    }
}
