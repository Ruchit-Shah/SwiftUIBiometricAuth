//
//  SessionManager.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Foundation

final class SessionManager {

    static let shared = SessionManager()

    private init() {}

    private let timeout: TimeInterval = 60

    func saveLoginTime() {

        UserDefaults.standard.set(
            Date(),
            forKey: "loginTime"
        )
    }

    func isSessionExpired() -> Bool {

        guard let date = UserDefaults.standard.object(
            forKey: "loginTime"
        ) as? Date else {

            return true
        }

        return Date().timeIntervalSince(date) > timeout
    }
}
