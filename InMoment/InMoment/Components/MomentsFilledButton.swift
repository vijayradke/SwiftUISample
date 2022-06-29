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
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(height: 40.0)
                .frame(maxWidth: .infinity)
                .font(Font.iBMPlexSans(.semiBold, size: 14))
                .foregroundColor(Color.white)
                .background {
                    Color.black
                }
                .cornerRadius(20.0)

        }
    }
}

struct MomentsFilledButton_Previews: PreviewProvider {
    static var previews: some View {
        MomentsFilledButton(title: "Click Here") {
            print("Clicked")
        }
    }
}
