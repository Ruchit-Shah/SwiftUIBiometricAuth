#
//  disable_biometrics.sh
//  SecureAuthSampleApp
//
//  Created by Ruchit on 26/05/26.
//


#!/bin/bash

echo "Disabling Biometrics..."

defaults write com.yourcompany.app biometric_enabled -bool false

echo "Biometrics Disabled"
