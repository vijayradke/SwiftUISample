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
    
    var body: some View {
        let buttonHeight: CGFloat = 40.0
        Button(action: action) {
            Text(title)
                .frame(height: buttonHeight)
                .frame(maxWidth: .infinity)
                .font(Font.iBMPlexSans(.semiBold, size: 14))
                .foregroundColor(Color.black)
                .background {
                    Color.white
                }
                .cornerRadius(buttonHeight/2.0)
                .overlay {
                    RoundedRectangle(cornerRadius: buttonHeight/2.0)
                        .stroke(.gray, lineWidth: 1)
                }

        }
    }
}

struct MomentsWhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        MomentsWhiteButton(title: "Click Here") {
            print("Clicked")
        }
    }
}
