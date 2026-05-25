//
//  KeychainService.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Foundation
import Security

final class KeychainService {

    static let shared = KeychainService()

    private init() {}

    func savePin(_ pin: String) {

        let data = Data(pin.utf8)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: Constants.pinKey,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    func getPin() -> String? {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: Constants.pinKey,
            kSecReturnData as String: true
        ]

        var result: AnyObject?

        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess,
           let data = result as? Data,
           let pin = String(data: data, encoding: .utf8) {

            return pin
        }

        return nil
    }
}
