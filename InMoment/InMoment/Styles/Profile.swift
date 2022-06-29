//
//  Profile.swift
//  Basics
//
//  Created by Gourav on 19/06/22.
//

import SwiftUI


struct ProfileButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) private var colorScheme
    
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
            .font(.subheadline.bold())
           //.foregroundStyle(btn)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(minWidth: minWidth)
            .background(Color.btnBgColor, in: Capsule())
            .contentShape(Capsule())
    }
}

extension ButtonStyle where Self == ProfileButtonStyle {
    static var profileButtonStyle: ProfileButtonStyle {
        ProfileButtonStyle()
    }
}


struct ProfileButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Common Button")
        }
        
        .buttonStyle(.profileButtonStyle)
        .preferredColorScheme(.dark)
    }
}
