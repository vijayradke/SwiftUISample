//
//  Validation.swift
//  Basics
//
//  Created by Gourav on 20/06/22.
//

import Foundation

/// test email validation
/// - Parameter testStr: testStr description
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: testStr)
    return result
}

/// test password validation
/// - Parameter testPass: testPass description
func isPasswordRegulier(testPass: String) -> Bool {
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{6,}$"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordTest.evaluate(with: testPass)
}

/// test password length
/// - Parameter testPass: testPass description
func isPasswordLengthValid(testPass: String) -> Bool {
    if testPass.count > 0 && testPass.count < 6 {
        return false
    }else {
        return true
    }
}
