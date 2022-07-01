//
//  ButtonDisabledStyle.swift
//  InMoment
//
//  Created by Gourav on 01/07/22.
//

import SwiftUI

struct ButtonDisabledStyle: ButtonStyle {
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
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
            .frame(width: 150,height:40)
            .font(Font.iBMPlexSans(.regular, size:  horizontalSizeClass == .regular ? 18 : 14))
            .foregroundColor(Color.white)
            .background { isEnabled ? Color.profileBtnFilled : Color.profileBtnSaveDisable}
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }

}

extension ButtonStyle where Self == ButtonDisabledStyle {
    static var buttonDisabledStyle: ButtonDisabledStyle {
        ButtonDisabledStyle()
    }
}


struct ButtonDisabledStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Common Button")
        }
        .previewLayout(.sizeThatFits)
        .disabled(false)
        .buttonStyle(.buttonDisabledStyle)
        .preferredColorScheme(.dark)
    }
}
