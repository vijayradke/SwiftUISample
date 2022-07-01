//
//  ProfileFooter.swift
//  InMoment
//
//  Created by Gourav on 01/07/22.
//

import SwiftUI

struct ProfileFooter: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        Text("Verson: 1.3")
            .font(Font.iBMPlexSans(.semiBold, size: horizontalSizeClass == .regular ? 18 : 14))
            .foregroundColor(Color.profileBtnFilled)
        Text("2022 InMoment, Inc. All rights reserved. \nUnauthorized access is prohibited").multilineTextAlignment(.center)
            .font(Font.iBMPlexSans(.regular, size: horizontalSizeClass == .regular ? 18 : 14))
            .foregroundColor(Color.profileBtnFilled)
    }
}

struct ProfileFooter_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFooter()
    }
}
