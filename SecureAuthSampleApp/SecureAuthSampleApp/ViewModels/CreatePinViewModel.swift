//
//  CreatePinViewModel.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import Combine
import Foundation
import SwiftUI

final class CreatePinViewModel: ObservableObject {

    @Published var pin = ""
    @Published var navigate = false

    func savePin() {

        guard pin.count == 4 else { return }

        AuthService.shared.savePin(pin)

        UserDefaults.standard.set(true,
                                  forKey: "isPinCreated")

        navigate = true
    }
}
