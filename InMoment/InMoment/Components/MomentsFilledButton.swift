//
//  MomentsButton.swift
//  InMoment
//
//  Created by Vijay Radake on 29/06/22.
//

import SwiftUI

struct MomentsFilledButton: View {
    var title: String
    var action: (() -> Void)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(height:40)
                .frame(maxWidth: .infinity)
                .font(Font.iBMPlexSans(.semiBold, size: horizontalSizeClass == .regular ? 18 : 14))
                .foregroundColor(Color.white)
                .background {
                    Color.black
                }
        }.clipShape(Capsule())
    }
}

struct MomentsFilledButton_Previews: PreviewProvider {
    static var previews: some View {
        MomentsFilledButton(title: "Click Here") {
            print("Clicked")
        }
        .previewLayout(.fixed(width: 300.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
