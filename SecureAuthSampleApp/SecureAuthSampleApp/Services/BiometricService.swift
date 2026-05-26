//
//  BiometricService.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

//import Foundation
//import LocalAuthentication
//
//#if DEBUG
//let mockBiometricSuccess = false
//#endif
//
//#if DEBUG
//var isDebugBypassEnabled: Bool {
//    UserDefaults.standard.bool(forKey: "DEBUG_BIOMETRIC_BYPASS")
//}
//#endif
//final class BiometricService {
//
//    static let shared = BiometricService()
//
//    private init() {}
//
//    func authenticate() async -> Bool {
//
//        #if DEBUG
//        if isDebugBypassEnabled {
//            print("⚠️ Debug biometric bypass enabled")
//            return true
//        }
//        #endif
//
//        let context = LAContext()
//        var error: NSError?
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//
//            do {
//                let success = try await context.evaluatePolicy(
//                    .deviceOwnerAuthenticationWithBiometrics,
//                    localizedReason: "Authenticate to continue"
//                )
//
//                return success
//
//            } catch {
//                print(error.localizedDescription)
//                return false
//            }
//        }
//
//        return false
//    }
//    
//    func biometricType() -> String {
//
//        let context = LAContext()
//
//        context.canEvaluatePolicy(
//            .deviceOwnerAuthenticationWithBiometrics,
//            error: nil
//        )
//
//        switch context.biometryType {
//
//        case .faceID:
//            return "Face ID"
//
//        case .touchID:
//            return "Touch ID"
//
//        default:
//            return "Biometric"
//        }
//    }
//}


import Foundation
import LocalAuthentication

final class BiometricService {

    static let shared = BiometricService()

    private init() {}

    // MARK: - Check Biometric Available

    func isBiometricAvailable() -> Bool {

        let context = LAContext()
        var error: NSError?

        let success = context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error
        )

        return success
    }

    // MARK: - Biometric Type

    func biometricType() -> String {

        let context = LAContext()
        var error: NSError?

        context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error
        )

        switch context.biometryType {
        case .faceID:
            return "Face ID"

        case .touchID:
            return "Touch ID"

        default:
            return "None"
        }
    }

    // MARK: - Authenticate

    func authenticate() async -> Bool {

        let context = LAContext()
        var error: NSError?

        guard context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error
        ) else {
            return false
        }

        do {

            let success = try await context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Authenticate to unlock app"
            )

            return success

        } catch {

            print(error.localizedDescription)
            return false
        }
    }
    
    
    func enableBiometric() {

        UserDefaults.standard.set(
            true,
            forKey: "biometric_enabled"
        )
    }

    func disableBiometric() {

        UserDefaults.standard.set(
            false,
            forKey: "biometric_enabled"
        )
    }

    func isBiometricEnabled() -> Bool {

        UserDefaults.standard.bool(
            forKey: "biometric_enabled"
        )
    }
}
