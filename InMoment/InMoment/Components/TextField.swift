//
//  TextField.swift
//  Basics
//
//  Created by Gourav on 17/06/22.
//

import SwiftUI


struct ReusableTextField: View {
    @Environment(\.colorScheme) var colorScheme
    var title:String
    var placeHolder:String
    var errorMessage:String
    var isDropDownEnabled : Bool = false
    var isTextFieldEnabled: Bool = false
    var isEdit: ((Bool) -> Void)
    
    @State private var showStoreDropDown : Bool = false
    @Binding var field: String
    @State private var isEditing : Bool = false
    var body: some View {
        VStack(alignment:.leading) {
            Text(title).foregroundColor(Color.black)
            
            ZStack{
                    TextField(placeHolder,text:$field) { isEditing in
                        isEdit(isEditing)
                        self.isEditing = isEditing
                    }
                     
                    .font(Font.iBMPlexSans(.medium, size: 14))
                    .frame(height: 40, alignment: .center)
                    .padding(.horizontal)
                    .background(isTextFieldEnabled ? .white : .gray.opacity(0.2))
                    .border(isEditing ? .black : .gray, width: isTextFieldEnabled ? 1 : 0)
                  
                    .cornerRadius(20)
                    .disabled(isTextFieldEnabled ? false : true)
                    .overlay(
                        Image("down-arrow")
                            .resizable()
                                .frame(width:20,height:20)
                                .padding(.trailing,20)
                                .opacity(isDropDownEnabled ? 1 : 0)
                            ,alignment: .trailing
                    )
                   
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isEditing ? .black : .gray, lineWidth: isTextFieldEnabled ? 1 : 0)
                    )
                   
                Button(action: {
                    print("tape")
                }, label: {
                    RoundedRectangle(cornerRadius: 20)
                      
                }).foregroundColor(Color.clear)
                    .disabled(isDropDownEnabled
                              ? false : true)
                    
            }
            Text(errorMessage)
                     .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color.red)
                    .font(Font.iBMPlexSans(.medium, size: 16))
                 
        }
    }
}




