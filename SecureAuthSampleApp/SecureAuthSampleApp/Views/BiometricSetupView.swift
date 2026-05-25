//
//  BiometricSetupView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import SwiftUI

struct BiometricSetupView: View {

    @StateObject var vm = BiometricSetupViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text("Enable Face ID")
                .font(.largeTitle)
            Toggle("Enable Biometrics",
                   isOn: Binding(
                    get: {
                        AuthService.shared.isBiometricEnabled()
                    },
                    set: { value in

                        UserDefaults.standard.set(
                            value,
                            forKey: Constants.biometricEnabled
                        )
                    }
                   ))
            .padding()

            NavigationLink("Go To Login") {
                LoginView()
            }
        }
        .padding()
    }
}
