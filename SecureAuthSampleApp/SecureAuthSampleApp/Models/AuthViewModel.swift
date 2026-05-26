//
//  AuthViewModel.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 26/05/26.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {

    @Published var isAuthenticated = false
    @Published var externalToken = ""
    @Published var biometricName = ""

    private let biometricService = BiometricService.shared
    private let externalService = ExternalUnlockService.shared

    init() {
        biometricName = biometricService.biometricType()
    }

    // MARK: - Face ID / Touch ID

    func authenticateWithBiometric() async {

        let success = await biometricService.authenticate()

        if success {
            isAuthenticated = true
        }
    }

    // MARK: - External Unlock

    func unlockExternally() {

        let success = externalService.validateExternalUnlock(
            token: externalToken
        )

        if success {
            isAuthenticated = true
        }
    }
}
