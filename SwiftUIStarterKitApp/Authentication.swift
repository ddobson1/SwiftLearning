//
//  Authentication.swift
//  SwiftUIStarterKitApp
//
//  Created by David Dobson on 28/06/2023.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import LocalAuthentication
import SwiftUI

struct Authentication: View {
    @State private var isUnlocked = false // this is how we use local state
//    print("First")
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
                    .foregroundColor(Color.green)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.top, 34)
                    .padding(.leading, 30)
            } else {
                Text("Locked")
                    .foregroundColor(Color.red)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.top, 34)
                    .padding(.leading, 30)
            }
        }
        .onAppear(perform: authenticate)
    }
    
    // 1.
    func authenticate() {
        print("Here")
        let context = LAContext()
        var error: NSError? // could be an error might not be

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            print("Here 2")
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                print("Here 3")
                // authentication has now completed
                if success {
                    print("Here 4")
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    print("Here 5")
                    // there was a problem
                }
            }
        } else {
            print("No Bio")
            // no biometrics
        }
    }
}
