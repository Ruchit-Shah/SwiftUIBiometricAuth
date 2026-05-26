#
//  enable_biometrics.sh
//  SecureAuthSampleApp
//
//  Created by Ruchit on 26/05/26.
//


#!/bin/bash

echo "Enabling Biometrics..."

defaults write com.yourcompany.app biometric_enabled -bool true

echo "Biometrics Enabled"
