//
//  ButtonWhiteStyle.swift
//  InMoment
//
//  Created by Gourav on 30/06/22.
//

import SwiftUI

struct ButtonBorderedStyle: ButtonStyle {
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var foregroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
    
    var backgroundColor: Color {
        colorScheme == .dark ? .white : .black
    }
    
    var minWidth: Double {
        #if os(iOS)
        return 80
        #else
        return 60
        #endif
    }
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .font(Font.iBMPlexSans(.regular, size:  horizontalSizeClass == .regular ? 18 : 14))
            .foregroundColor(Color.profileBtnFilled)
            .background {
                Color.white
                Capsule()
                    .stroke(.gray, lineWidth: 1)
            }
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
    
}

extension ButtonStyle where Self == ButtonBorderedStyle {
    static var buttonBorderedStyle: ButtonBorderedStyle {
        ButtonBorderedStyle()
    }
}


struct ButtonBorderedStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Click Here")
        }
        .previewLayout(.sizeThatFits)
        
        .buttonStyle(.buttonBorderedStyle)
        .preferredColorScheme(.dark)
    }
}
