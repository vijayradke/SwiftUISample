//
//  ProfileTextfieldStyle.swift
//  InMoment
//
//  Created by Gourav on 30/06/22.
//

import SwiftUI

struct ProfileTextfieldStyle: TextFieldStyle {
    
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
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .font(Font.iBMPlexSans(.medium, size: horizontalSizeClass == .regular ? 18 : 14))
                .frame(height: 40, alignment: .center)
                .padding(.horizontal)
                .cornerRadius(20)
    }
}

extension TextFieldStyle where Self == ProfileTextfieldStyle {
    static var profileTextfieldStyle: ProfileTextfieldStyle {
          ProfileTextfieldStyle()
    }
}


struct ProfileTextfieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        TextField("Name", text: .constant("test"))
            .textFieldStyle(ProfileTextfieldStyle())
    }
}
