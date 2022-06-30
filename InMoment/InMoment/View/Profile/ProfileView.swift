//
//  ProfileView.swift
//  Basics
//
//  Created by Gourav on 13/06/22.
//

import SwiftUI



struct SaveButton: View {
    @Binding var isValid:Bool
    var clicked: (() -> Void)
    var body: some View {
        Button(action: clicked) {
            Text("Save")
                
               .frame(width: 150,height:40)
                .foregroundColor(Color.white)
                .background(isValid ? Color.black : Color.gray)
                .cornerRadius(20)
                .font(.system(size: 15))
               
        }.disabled(isValid ? false : true)
    }
}


struct ProfileView: View {
    
    @StateObject var viewModel = User()
    
    @State var editing: Bool = false
    @State var inputText: String = ""
    @State var vOffset: CGFloat = 30
    @State var hOffset: CGFloat = 0
    
    @State var isNight : Bool = true
    @State var isShowingSheet = false
    @State var txtlang :String = ""
    @State var txtEmail :String = ""
    @State var txtCountryCode :String = ""
    @State var txtPhone :String = ""
    @State var txtCity :String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModela = LoginViewModel()

    var body: some View {
        
        CustomNavBar(title: "InMoment", content:
                        ZStack {
                            //Color(isNight ? .black : .white).ignoresSafeArea()
                            VStack {
                                
                                ProfileInfo(name:"John Wompey", position: "CEO", dismiss: {
                                    presentationMode.wrappedValue.dismiss()
                                })
                                Divider()
                               
                                List {
                                    
                                    VStack(spacing: 18) {
                                        
                                        ProfileHeader(name:"John Wompey")
                                       
                                        VStack(alignment:.leading,spacing:5){
                                            // MARK: Email
                                            
                                            ZStack {
                                                ReusableTextField(title: "Language", placeHolder: "English", errorMessage: viewModel.inlineLanguageError, isDropDownEnabled: true, isTextFieldEnabled: true, isEdit: { isEditing in
                                                    self.editing = isEditing
                                                }, field: $viewModel.language)
                                                SuggestionTextFieldMenu(editing: $editing, text: $viewModel.language, verticalOffset: vOffset, horizontalOffset: hOffset)
                                                    .offset(y: -70)
                                            }
                                            ReusableTextField(title: "Email", placeHolder: "gouravma@cybage.com", errorMessage: viewModel.inlineEmailError, isDropDownEnabled:false, isTextFieldEnabled:true, isEdit: { isEditing in
                                                self.editing = isEditing
                                            }, field: $viewModel.email)
                                            
                                            ZStack {
                                                ReusableTextField(title: "Country code", placeHolder: "United States(1)", errorMessage: viewModel.inlineCountryCodeError, isDropDownEnabled:true, isTextFieldEnabled:true, isEdit: { isEditing in
                                                    self.editing = isEditing
                                                }, field:$viewModel.countryCode)
                                                
                                                SuggestionTextFieldMenu(editing: $editing, text: $viewModel.countryCode, verticalOffset: 20, horizontalOffset: hOffset)
                                                    .offset(y: -60)
                                                
                                            }
                                            
                                            
                                            ReusableTextField(title: "Phone", placeHolder: "34349345", errorMessage: viewModel.inlinePhoneError, isDropDownEnabled:false, isTextFieldEnabled:true, isEdit: { isEditing in
                                                self.editing = isEditing
                                            }, field: $viewModel.phone)
                                            
                                            ReusableTextField(title: "City", placeHolder: "Salt Lanke City, UT", errorMessage: viewModel.inlineCityError, isDropDownEnabled:false, isTextFieldEnabled:true, isEdit: { isEditing in
                                                self.editing = isEditing
                                            }, field: $viewModel.city)
                                            
                                        }
                                        
                                        SaveButton(isValid:$viewModel.allsatify) {}
                                        
                                        Text("Verson: 1.3")
                                            .font(.system(size: 13))
                                        
                                        Text("2022 InMoment, Inc. All rights reserved. \nUnauthorized access is prohibited").multilineTextAlignment(.center)
                                            .font(.system(size: 13))
                                        
                                    }
                                    .padding([.top,.leading,.trailing], 5)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                }
                                .listRowSeparator(.hidden)
                                .listStyle(.plain)
                                .safeAreaInset(edge: .bottom, spacing: 0) {
                                    Spacer()
                                        .frame(height: 44)
                                   
                                }
                            }
                        }
                     ,  toolbar:
                               Text("")
           )
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
                .previewDevice("iphone 11 ")
            ProfileView()
                .previewDevice("iPad (9th generation)")
        }
    }
}

