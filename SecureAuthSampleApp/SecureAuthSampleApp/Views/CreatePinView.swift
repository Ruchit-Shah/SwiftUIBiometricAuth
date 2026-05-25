//
//  CreatePinView.swift
//  SecureAuthSampleApp
//
//  Created by Ruchit on 25/05/26.
//

import SwiftUI

struct CreatePinView: View {

    @StateObject var vm = CreatePinViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Create PIN")
                    .font(.largeTitle)

                SecureField("4 Digit PIN",
                            text: $vm.pin)
                    .keyboardType(.numberPad)
                    .padding()
                    .border(Color.gray)

                Button("Save PIN") {
                    vm.navigate = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                NavigationLink(
                    destination: ConfirmPinView(originalPin: vm.pin),
                    isActive: $vm.navigate
                ) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}
