//
//  BiometricUnlockView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 26/05/26.
//

import SwiftUI

struct BiometricUnlockView: View {

    @StateObject private var viewModel = AuthViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Spacer()

            Image(
                systemName:
                    viewModel.biometricName == "Face ID"
                    ? "faceid"
                    : "touchid"
                )
                .resizable()
                .frame(width: 100, height: 100)

            Text(viewModel.biometricName)
                .font(.title)

            Button {

                Task {
                    await viewModel.authenticateWithBiometric()
                }

            } label: {

                Text("Unlock with \(viewModel.biometricName)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

            .padding(.horizontal)

            Divider()
                .padding()

            Text("External Unlock")

            TextField(
                "Enter External Token",
                text: $viewModel.externalToken
            )
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)

            Button {

                viewModel.unlockExternally()

            } label: {

                Text("Unlock Externally")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()

            if viewModel.isAuthenticated {

                Text("✅ App Unlocked")
                    .foregroundColor(.green)
                    .font(.headline)
            }
        }
    }
}
