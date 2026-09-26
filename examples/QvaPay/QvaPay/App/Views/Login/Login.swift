//
//  Login.swift
//  QvaPay
//
//  Created by Pedro Omar  on 9/25/26.
//

import SwiftUI

struct Login: View {
    @Environment(QvaPayRequest.self) private var qvapayRequest
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        @Bindable var qvapay = qvapayRequest
        
        NavigationStack {
            if qvapay.isAuth {
                
            } else {
                ContentView().environment(qvapayRequest)
            }
        }
    }
}

#Preview {
    Login().environment(QvaPayRequest())
}
