//
//  Button.swift
//  Basics
//
//  Created by Gourav on 17/06/22.
//

import SwiftUI

struct ReusableButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    var title:String
    
    var type :ButtonType = .light
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(title)
                .frame(height:40)
                .frame(maxWidth: .infinity)
                .font(Font.iBMPlexSans(.regular, size: 14))
                
                .if(type == .dark ) { content in
                    content.background(
                        Color.black
                    )
                    .cornerRadius(20)
                }
                .foregroundColor(type == .dark ? Color.white : Color.black)
                .if(type == .light ) { view in
                    view.background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                }
              
        }
    }
    
    enum ButtonType{
        case light
        case dark
    }
}

struct Previews_Button_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(title: "Title",type:.light)
        {
          
        }
    }
}
