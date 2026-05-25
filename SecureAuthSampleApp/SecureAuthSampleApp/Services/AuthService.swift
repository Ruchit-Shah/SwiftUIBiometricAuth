//
//  AuthService.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Foundation

final class AuthService {

    static let shared = AuthService()

    private init() {}

    func savePin(_ pin: String) {
        KeychainService.shared.savePin(pin)
    }

    func validatePin(_ pin: String) -> Bool {
        return KeychainService.shared.getPin() == pin
    }

    func enableBiometric() {
        UserDefaults.standard.set(true,
                                  forKey: Constants.biometricEnabled)
    }

    func isBiometricEnabled() -> Bool {
        return UserDefaults.standard.bool(
            forKey: Constants.biometricEnabled
        )
    }
}
