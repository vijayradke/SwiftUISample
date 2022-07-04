//
//  TextField.swift
//  Basics
//
//  Created by Gourav on 17/06/22.
//

import SwiftUI

enum TextFieldType{
    case editable
    case dropdown
    case disabled
}

struct ReusableTextField: View {
    @Environment(\.colorScheme) var colorScheme
    
    var title:String
    var placeHolder:String
    var errorMessage:String
    var textFieldType : TextFieldType = .disabled
    //var isTextFieldEnabled: Bool = false
    var isEdit: ((Bool) -> Void)
    
    @State private var showStoreDropDown : Bool = false
    @Binding var field: String
    @State private var isEditing : Bool = false
    

    var body: some View {
         VStack(alignment:.leading,spacing:5) {
            Text(title).foregroundColor(Color.black)
                .font(Font.iBMPlexSans(.regular, size: 16))
            
            TextField(placeHolder,text:$field) { isEditing in
                isEdit(isEditing)
                self.isEditing = isEditing
            }
            .textFieldStyle(ProfileTextfieldStyle())
            .if(textFieldType == .dropdown, transform: { txt in
                txt.overlay(
                    ZStack{
                        Image("down-arrow")
                            .resizable()
                            .frame(width:20,height:20)
                            .padding(.trailing,20)
                    }
                    ,alignment: .trailing
                )
                .background(RoundedRectangle(cornerRadius: 20).stroke(isEditing ? Color.profileTxtBorderDark : Color.profileTxtBorderLight, lineWidth: isEditing ?  1 : 0.5))
            })
             .if(textFieldType == .disabled, transform: { txt in
                    txt
                        .background(
                            ZStack {
                                Color.profileTxtBg
                                RoundedRectangle(cornerRadius: 20).stroke(isEditing ? Color.profileTxtBorderDark : Color.profileTxtBorderLight, lineWidth:  isEditing ?  1 : 0.5)
                            }
                        )
                        .clipShape(Capsule())
                        .disabled(true)
                })
                .if(textFieldType == .editable, transform: { txt in
                    txt
                    .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isEditing ? Color.profileTxtBorderDark : Color.profileTxtBorderLight, lineWidth:  isEditing ?  1 : 0.5)
                        )
                    })
             
            Text(errorMessage)
                .font(Font.iBMPlexSans(.medium, size: 14))
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color.red)
         }
       
    }
}




struct ReusableTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReusableTextField(title: "Test", placeHolder: "Email", errorMessage: "", isEdit: { isEdit in
            
        }, field: .constant("this is sample text"))
        .previewLayout(.fixed(width: 300.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
