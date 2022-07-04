//
//  MomentsButton.swift
//  InMoment
//
//  Created by Vijay Radake on 29/06/22.
//

import SwiftUI

struct MomentsButton: View {
    var title: String
    var type :MomentButtonType = .save
    var action: (() -> Void)
    
    var body: some View {

        Button(action: action) {
            Text(title)
        }
        .if(type == .filled) { btn in
            btn.buttonStyle(.buttonFilledStyle)
        }
        .if(type == .bordered) { btn in
            btn.buttonStyle(.buttonBorderedStyle)
        }
        .if(type == .save) { btn in
            btn.buttonStyle(.buttonDisabledStyle)
        }
    }
    
    enum MomentButtonType {
        case filled
        case bordered
        case save
    }
}

struct MomentsFilledButton_Previews: PreviewProvider {
 
    static var previews: some View {
       
        MomentsButton(title: "Click Here") {
            print("Clicked")
        }
        .previewLayout(.fixed(width: 300.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
