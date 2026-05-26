//
//  ExternalUnlockService.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 26/05/26.
//

import Foundation

final class ExternalUnlockService {

    static let shared = ExternalUnlockService()

    private init() {}

    // Simulated external unlock token
    private let validToken = "RUCHIT_UNLOCK_2026"

    func validateExternalUnlock(token: String) -> Bool {
        return token == validToken
    }
}
