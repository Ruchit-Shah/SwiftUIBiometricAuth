//
//  ConfirmPinView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import SwiftUI

struct ConfirmPinView: View {

    let originalPin: String

    @State private var confirmPin = ""
    @State private var error = ""
    @State private var navigate = false

    var body: some View {

        VStack(spacing: 20) {

            Text("Confirm PIN")
                .font(.largeTitle)

            SecureField("Re-enter PIN",
                        text: $confirmPin)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)

            if !error.isEmpty {
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Confirm") {

                if confirmPin == originalPin {

                    AuthService.shared.savePin(confirmPin)

                    UserDefaults.standard.set(
                        true,
                        forKey: "isPinCreated"
                    )

                    navigate = true

                } else {
                    error = "PIN does not match"
                }
            }

            NavigationLink(
                destination: BiometricSetupView(),
                isActive: $navigate
            ) {
                EmptyView()
            }
        }
        .padding()
    }
}
