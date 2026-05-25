//
//  LoginView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import SwiftUI

struct LoginView: View {

    @StateObject var vm = LoginViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text("Login")
                .font(.largeTitle)

            SecureField("Enter PIN", text: $vm.pin)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)

            if !vm.errorMessage.isEmpty {

                Text(vm.errorMessage)
                    .foregroundColor(.red)
            }

            Button("Login") {
                vm.login()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Use \(BiometricService.shared.biometricType())") {

                BiometricService.shared.authenticate { success in

                    vm.isUnlocked = success
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            if vm.isLocked {

                Text("App Temporarily Locked")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
