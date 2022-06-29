//
//  String+Extension.swift
//  Basics
//
//  Created by Gourav on 22/06/22.
//

import Foundation

extension String {
    func getFirstChar()->String {
        let firstNameFirstChar = self.components(separatedBy: " ").first?.first?.uppercased() ?? ""
        let lastNameFirstChar = self.components(separatedBy: " ").last?.first?.uppercased() ?? ""
        return firstNameFirstChar + lastNameFirstChar
    }
}
