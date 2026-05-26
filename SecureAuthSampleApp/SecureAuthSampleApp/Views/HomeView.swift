//
//  HomeView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//
import SwiftUI

struct HomeView: View {

    @AppStorage("isUnlocked") private var isUnlocked = false
    @AppStorage("isPinCreated") private var isPinCreated = false

    var body: some View {
#if DEBUG
Toggle(
    "Enable Debug Biometric Bypass",
    isOn: Binding(
        get: {
            UserDefaults.standard.bool(forKey: "DEBUG_BIOMETRIC_BYPASS")
        },
        set: {
            UserDefaults.standard.set($0, forKey: "DEBUG_BIOMETRIC_BYPASS")
        }
    )
)
.padding()
#endif
        VStack(spacing: 20) {

            Image(systemName: "lock.open.fill")
                .resizable()
                .frame(width: 100, height: 100)

            Text("Welcome Home")

            Button("Logout") {
                print("Logout clicked")
                isUnlocked = false
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Reset PIN") {

                isPinCreated = false
                isUnlocked = false
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        VStack(spacing: 20) {

            Button("Enable Biometrics") {

                BiometricService.shared.enableBiometric()
            }

            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Disable Biometrics") {

                BiometricService.shared.disableBiometric()
            }

            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)

            Text(
                BiometricService.shared.isBiometricEnabled()
                ? "Biometric Enabled"
                : "Biometric Disabled"
            )
        }
    }
}

