//
//  Profile.swift
//  Basics
//
//  Created by Gourav on 19/06/22.
//

import SwiftUI


struct ButtonFilledStyle: ButtonStyle {
    
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
            .frame(height:40)
            .frame(maxWidth: .infinity)
            .font(Font.iBMPlexSans(.regular, size: horizontalSizeClass == .regular ? 18 : 14))
            .foregroundColor(Color.white)
            .background(Color.black, in: Capsule())
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
    
}

extension ButtonStyle where Self == ButtonFilledStyle {
    static var buttonFilledStyle: ButtonFilledStyle {
        ButtonFilledStyle()
    }
}


struct ButtonFilledStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Common Button")
        }
        .previewLayout(.sizeThatFits)
        
        .buttonStyle(.buttonFilledStyle)
        .preferredColorScheme(.dark)
    }
}
