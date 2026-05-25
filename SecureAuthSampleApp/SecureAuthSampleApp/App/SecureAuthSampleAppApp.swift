//
//  SecureAuthSampleAppApp.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import SwiftUI

@main
struct SecureAuthSampleAppApp: App {

    @AppStorage("isPinCreated") var isPinCreated = false
    @AppStorage("isUnlocked") var isUnlocked = false

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {

        WindowGroup {

            if !isPinCreated {

                CreatePinView()

            } else if isUnlocked {

                HomeView()

            } else {

                LoginView()
            }
        }
        .onChange(of: scenePhase) { newPhase in

            if newPhase == .background {

                isUnlocked = false
            }
        }
    }
}



