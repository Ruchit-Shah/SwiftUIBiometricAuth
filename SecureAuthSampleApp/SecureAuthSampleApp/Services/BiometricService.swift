//
//  BiometricService.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Foundation
import LocalAuthentication

#if DEBUG
let mockBiometricSuccess = false
#endif

final class BiometricService {

    static let shared = BiometricService()

    private init() {}

    func authenticate(completion: @escaping (Bool) -> Void) {

    #if DEBUG
    if mockBiometricSuccess {
        completion(true)
        return
    }
    #endif
        
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error
        ) {

            let reason = "Unlock using Face ID"

            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            ) { success, _ in

                DispatchQueue.main.async {
                    completion(success)
                }
            }

        } else {
            completion(false)
        }
    }
    
    func biometricType() -> String {

        let context = LAContext()

        context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: nil
        )

        switch context.biometryType {

        case .faceID:
            return "Face ID"

        case .touchID:
            return "Touch ID"

        default:
            return "Biometric"
        }
    }
}
