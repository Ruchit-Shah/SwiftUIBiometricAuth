//
//  BiometricSetupViewModel.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Combine
import Foundation
import SwiftUI

final class BiometricSetupViewModel: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    func enableBiometric() {
        AuthService.shared.enableBiometric()
    }
}
