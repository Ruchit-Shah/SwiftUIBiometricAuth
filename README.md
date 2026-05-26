# SwiftUIBiometricAuth

Secure authentication app built with SwiftUI using MVVM architecture, PIN login, Face ID/Touch ID, Keychain security, and enterprise-ready biometric authentication enhancements.

---

# SecureAuthSampleApp

A secure authentication sample application built using SwiftUI and MVVM Architecture demonstrating:

- PIN Creation & Validation
- Biometric Authentication (Face ID / Touch ID)
- Secure Keychain Storage
- App Lock on Background
- SwiftUI Navigation Flow
- Clean MVVM Structure
- External Unlock Support
- Enterprise Authentication Extensibility

---

# Features

## PIN Authentication

- Create a secure 4-digit PIN
- Confirm PIN before saving
- Login using saved PIN
- Logout functionality
- Auto lock when app goes to background

---

## Biometrics Support

- Face ID support
- Touch ID support
- LocalAuthentication framework integration
- Fallback to PIN login
- Dynamic biometric UI handling
- Biometric availability detection
- Enable/disable biometric support

---

## Security

- Secure PIN storage using Keychain
- No plain text sensitive storage
- App relocks when moved to background
- Secure authentication flow
- External authentication validation support

---

## Architecture

This project follows:

- MVVM Architecture
- SwiftUI
- Service Layer
- Separation of Concerns
- Reusable Components
- Scalable Authentication Structure

---

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
│   ├── BiometricSetupView.swift
│   └── BiometricUnlockView.swift
│
├── ViewModels
│   ├── CreatePinViewModel.swift
│   ├── LoginViewModel.swift
│   ├── BiometricSetupViewModel.swift
│   └── AuthViewModel.swift
│
├── Services
│   ├── AuthService.swift
│   ├── KeychainService.swift
│   ├── BiometricService.swift
│   └── ExternalUnlockService.swift
│
├── Utilities
│   └── Constants.swift
│
├── Scripts
│   ├── enable_biometrics.sh
│   └── disable_biometrics.sh
│
└── Resources
```
---

# Technologies Used

- Swift 6
- SwiftUI
- MVVM Architecture
- Combine
- LocalAuthentication Framework
- Keychain Services
- Xcode 16+
- iOS 17+

---

# Authentication Flow

## First Launch

1. User creates a PIN
2. User confirms PIN
3. PIN stored securely in Keychain
4. User can optionally enable biometrics

---

## Login Flow

1. User enters PIN OR uses biometrics
2. Authentication validated
3. Navigate to Home Screen

---

## External Unlock Flow

1. External token validation initiated
2. Authentication service validates token
3. Secure unlock access granted
4. User session authenticated

---

## Background Security

When app moves to background:

- User session locks automatically
- User must authenticate again

---

# MVVM Overview

## View

Responsible for:

- UI rendering
- User interactions
- State binding

---

## ViewModel

Responsible for:

- Business logic
- Validation
- Navigation state
- Service communication

---

## Services

Responsible for:

- Keychain access
- Biometric handling
- Authentication logic
- External unlock validation

---

# Keychain Usage

Sensitive data like PIN is stored securely using Keychain.

## Example

swift KeychainService.shared.savePin(pin) 

## Retrieve

swift let savedPin = KeychainService.shared.getPin() 

---

# Biometric Authentication

Uses Apple’s LocalAuthentication framework.

## Example

swift let context = LAContext() 

## Supported

- Face ID
- Touch ID

---

# New Authentication Enhancements

This project now supports advanced biometric authentication flows with enterprise-ready extensibility.

## Added Features

### Authentication Enhancements

- Face ID Authentication
- Touch ID Authentication
- Biometric Availability Detection
- Dynamic Biometric UI Handling
- External Token-Based Unlock
- Enable/Disable Biometric Support
- Reusable Authentication Service Layer
- MVVM-Based Authentication Improvements

---

# External Unlock Support

The application includes support for external unlock validation using secure token-based mechanisms.

This architecture can be extended for:

- QR-Based Unlock
- BLE Device Unlock
- RFID Unlock
- Backend Session Validation
- MDM-Controlled Authentication
- Enterprise Kiosk Authentication

---

# Architecture Improvements

- Improved Separation of Concerns
- Scalable Authentication Structure
- Reusable Service Layer
- Better Authentication State Handling
- Enterprise/Kiosk Ready Authentication Flow

---

# Security Improvements

- Secure Authentication Flow
- Keychain-Based Sensitive Storage
- Biometric Authentication Validation
- Automatic App Relock on Background
- External Authentication Support

---

# How to Run

## Requirements

- macOS
- Xcode 16+
- iOS 17+

---

## Steps

### 1. Clone Repository

bash git clone https://github.com/Ruchit-Shah/SwiftUIBiometricAuth.git 

### 2. Open Project

bash open SecureAuthSampleApp.xcodeproj 

### 3. Run Project Using

- Simulator
- Real Device

---

# Configuration

## Enable Face ID

Add in Info.plist:

xml <key>NSFaceIDUsageDescription</key> <string>Use Face ID to unlock the app securely.</string> 

---

# Testing Checklist

## Functional Testing

- PIN Creation
- Confirm PIN
- Login Validation
- Logout Flow
- Face ID Login
- Touch ID Login
- External Token Unlock
- App Background Lock
- Keychain Save/Retrieve

---

## Edge Cases

- Wrong PIN
- Empty PIN
- Biometric Failure
- Invalid External Token
- App Relaunch

---

# Future Improvements

Potential enhancements:

- OTP Authentication
- Firebase Authentication
- Secure Enclave Integration
- Session Timeout
- Jailbreak Detection
- Root Detection
- Unit Testing
- UI Testing
- CI/CD Integration
- Multi-factor Authentication
- QR-Based Unlock
- BLE Unlock
- RFID Unlock
- Backend Session Validation
- MDM-Controlled Authentication
- Enterprise Device Trust Validation
- Dark Mode Customization

---

# Screens Included

- Create PIN Screen
- Confirm PIN Screen
- Login Screen
- Biometric Setup Screen
- Biometric Unlock Screen
- Home Screen

---

# Author

Ruchit Shah  
Senior iOS Developer  
Swift | SwiftUI | MVVM | Mobile Architecture

---

# License

This project is for learning and demonstration purposes.

---

# Highlights

- SwiftUI Based
- MVVM Architecture
- Keychain Security
- Face ID / Touch ID
- External Unlock Support
- Clean Code Structure
- Production Style Authentication Flow
- Enterprise Ready Authentication Design
- Reusable Service Layer
- Scalable Secure Authentication
