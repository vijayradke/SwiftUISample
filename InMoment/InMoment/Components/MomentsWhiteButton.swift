//
//  MomentsWhiteButton.swift
//  InMoment
//
//  Created by Vijay Radake on 29/06/22.
//

import SwiftUI

struct MomentsWhiteButton: View {
    var title: String
    var action: (() -> Void)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {

        Button(action: action) {
            Text(title)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .font(Font.iBMPlexSans(.semiBold, size:  horizontalSizeClass == .regular ? 18 : 14))
                .foregroundColor(Color.black)
                .background {
                    Color.white
                    Capsule()
                        .stroke(.gray, lineWidth: 1)
                }
        }.clipShape(Capsule())
    }
}

struct MomentsWhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        MomentsWhiteButton(title: "Click Here") {
            print("Clicked")
        }
        .previewLayout(.fixed(width: 300, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
