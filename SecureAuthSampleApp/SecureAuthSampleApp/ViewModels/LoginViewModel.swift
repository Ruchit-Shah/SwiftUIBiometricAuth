//
//  LoginViewModel.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Combine
import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {

    @AppStorage("isUnlocked") var isUnlocked = false

    @Published var pin = ""
    @Published var errorMessage = ""
    @Published var attempts = 0
    @Published var isLocked = false

    init() {
        autoBiometricLogin()
    }

    func login() {

        guard !isLocked else { return }

        if AuthService.shared.validatePin(pin) {

            isUnlocked = true
            attempts = 0

            SessionManager.shared.saveLoginTime()

        } else {

            attempts += 1
            errorMessage = "Invalid PIN"

            if attempts >= 5 {

                isLocked = true
                errorMessage = "Too many attempts"
            }
        }
    }

    func autoBiometricLogin() {

        if AuthService.shared.isBiometricEnabled() {

            BiometricService.shared.authenticate { success in

                DispatchQueue.main.async {
                    self.isUnlocked = success
                }
            }
        }
    }
}
