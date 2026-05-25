# SwiftUIBiometricAuth
Secure authentication app built with SwiftUI using MVVM architecture, PIN login, Face ID/Touch ID, and Keychain security.

SecureAuthSampleApp

A secure authentication sample application built using SwiftUI and MVVM Architecture demonstrating:

* PIN Creation & Validation
* Biometric Authentication (Face ID / Touch ID)
* Secure Keychain Storage
* App Lock on Background
* SwiftUI Navigation Flow
* Clean MVVM Structure

⸻

Features

PIN Authentication

* Create a secure 4-digit PIN
* Confirm PIN before saving
* Login using saved PIN
* Logout functionality
* Auto lock when app goes to background

Biometrics Support

* Face ID support
* Touch ID support
* LocalAuthentication framework integration
* Fallback to PIN login

Security

* Secure PIN storage using Keychain
* No plain text sensitive storage
* App relocks when moved to background

Architecture

This project follows:

* MVVM Architecture
* SwiftUI
* Service Layer
* Separation of Concerns
* Reusable Components

⸻

# Project Structure

```bash
SecureAuthSampleApp
│
├── App
│   └── SecureAuthSampleAppApp.swift
│
├── Models
│   └── AuthState.swift
│
├── Views
│   ├── CreatePinView.swift
│   ├── ConfirmPinView.swift
│   ├── LoginView.swift
│   ├── HomeView.swift
│   └── BiometricSetupView.swift
│
├── ViewModels
│   ├── CreatePinViewModel.swift
│   ├── LoginViewModel.swift
│   └── BiometricSetupViewModel.swift
│
├── Services
│   ├── AuthService.swift
│   ├── KeychainService.swift
│   └── BiometricService.swift
│
├── Utilities
│   └── Constants.swift
│
└── Resources
```

⸻

Technologies Used

* Swift 6
* SwiftUI
* MVVM Architecture
* Combine
* LocalAuthentication Framework
* Keychain Services
* Xcode 16+
* iOS 17+

⸻

Authentication Flow

First Launch

1. User creates a PIN
2. User confirms PIN
3. PIN stored securely in Keychain
4. User can optionally enable biometrics

Login Flow

1. User enters PIN OR uses biometrics
2. Authentication validated
3. Navigate to Home Screen

Background Security

* When app moves to background:
    * User session locks automatically
    * User must authenticate again

⸻

MVVM Overview

View

Responsible for:

* UI rendering
* User interactions
* State binding

ViewModel

Responsible for:

* Business logic
* Validation
* Navigation state
* Service communication

Services

Responsible for:

* Keychain access
* Biometric handling
* Authentication logic

⸻

Keychain Usage

Sensitive data like PIN is stored securely using Keychain.

Example:

KeychainService.shared.savePin(pin)

Retrieve:

let savedPin = KeychainService.shared.getPin()

⸻

Biometric Authentication

Uses Apple’s LocalAuthentication framework.

Example:

let context = LAContext()

Supported:

* Face ID
* Touch ID

⸻

How to Run

Requirements

* macOS
* Xcode 16+
* iOS 17+

Steps

1. Clone repository

git clone <repository-url>

2. Open project

open SecureAuthSampleApp.xcodeproj

3. Run project using:

* Simulator
* Real Device

⸻

Configuration

Enable Face ID

Add in Info.plist:

<key>NSFaceIDUsageDescription</key>
<string>Use Face ID to unlock the app securely.</string>

⸻

Testing Checklist

Functional Testing

* PIN Creation
* Confirm PIN
* Login Validation
* Logout Flow
* Face ID Login
* App Background Lock
* Keychain Save/Retrieve

Edge Cases

* Wrong PIN
* Empty PIN
* Biometric Failure
* App Relaunch

⸻

Future Improvements

Potential enhancements:

* OTP Authentication
* Firebase Authentication
* Secure Enclave Integration
* Session Timeout
* Jailbreak Detection
* Root Detection
* Unit Testing
* UI Testing
* CI/CD Integration
* Multi-factor Authentication
* Dark Mode Customization

⸻

Screens Included

* Create PIN Screen
* Confirm PIN Screen
* Login Screen
* Biometric Setup Screen
* Home Screen

⸻

Author

Ruchit Shah
Senior iOS Developer
Swift | SwiftUI | MVVM | Mobile Architecture

⸻

License

This project is for learning and demonstration purposes.

⸻

Highlights

SwiftUI Based
MVVM Architecture
Keychain Security
Face ID / Touch ID
Clean Code Structure
Production Style Authentication Flow
