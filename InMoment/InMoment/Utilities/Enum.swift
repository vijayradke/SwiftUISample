//
//  Enum.swift
//  Basics
//
//  Created by Gourav on 20/06/22.
//

import SwiftUI


enum TextFieldCheck {
    case valid
    case empty
    case notValid
}

//MARK: Font Extension
extension Font {
    enum IBMPlexSans {
        case bold
        case boldItalic
        case extraLight
        case extraLightItalic
        case italic
        case light
        case lightItalic
        case medium
        case mediumItalic
        case regular
        case semiBold
        case semiBoldItalic
        case thin
        case thinItalic
        case custom(String)
        
        var value: String {
            switch self {
            case .bold:
                return "IBMPlexSans-Bold"
            case .boldItalic:
                return "IBMPlexSans-BoldItalic"
            case .extraLight:
                return "IBMPlexSans-ExtraLight"
            case .extraLightItalic:
                return "IBMPlexSans-ExtraLight"
            case .italic:
                return "IBMPlexSans-Italic"
            case .light:
                return "IBMPlexSans-Light"
            case .lightItalic:
                return "IBMPlexSans-LightItalic"
            case .medium:
                return "IBMPlexSans-Medium"
            case .mediumItalic:
                return "IBMPlexSans-MediumItalic"
            case .regular:
                return "IBMPlexSans-Regular"
            case .semiBold:
                return "IBMPlexSans-SemiBold"
            case .semiBoldItalic:
                return "IBMPlexSans-SemiBoldItalic"
            case .thin:
                return "IBMPlexSans-Thin"
            case .thinItalic:
                return "IBMPlexSans-ThinItalic"
            case .custom(let name):
                return name
            }
        }
    }

    static func iBMPlexSans(_ type: IBMPlexSans, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}


    
