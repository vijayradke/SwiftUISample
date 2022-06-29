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

    @StateObject private var viewModela = LoginViewModel()

    var body: some View {
        
        CustomNavBar(title: "InMoment", content:
                        ZStack {
                            //Color(isNight ? .black : .white).ignoresSafeArea()
                            VStack {
                                
                                ProfileInfo(name:"John Wompey")
                                Divider()
                               
                               
                                ScrollView() {
                                    
                                    VStack(spacing:18) {
                                        
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
                                    .padding([.top,.leading,.trailing], 15)
                                    
                                }
                                
                                .safeAreaInset(edge: .bottom, spacing: 0) {
                                    Spacer()
                                        .frame(height: 44)
                                   
                                }
                            }
                        }
                     ,  toolbar:
                               Text("")
           )
     
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
            ProfileView()
    }
}





fileprivate func ProfileInfo(name:String) -> some View {

    @Environment(\.presentationMode) var presentationMode
    
    return HStack() {
        
        VStack{
            Text(name).font(Font.iBMPlexSans(.semiBold, size: 20))
            
            Text("CEO").foregroundColor(Color.gray)
                .font(Font.iBMPlexSans(.regular, size: 14))
        }
        // .frame(width: .infinity, height: 50)
   
    }
    .frame(maxWidth: .infinity)
    
    .overlay(
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("left-Arrow")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
        }.padding(.leading,15)
        
        , alignment: .leading)
}

fileprivate func ProfileHeader(name:String) -> some View {
  
     let profileImage = "https://www.hackingwithswift.com/img/paul-2.png"

    @Environment(\.colorScheme) var colorScheme
    return HStack(spacing:20) {
        
            //.cornerRadius(150)
            AsyncImage(url: URL(string: profileImage)) { image in
                image.resizable()
            } placeholder: {
                Text(name.getFirstChar()).frame(width: 150, height: 150)
                    .font(Font.iBMPlexSans(.regular, size: 60))
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .background(colorScheme == .dark ? .white.opacity(0.8)  : .black)
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 150))
        
            .overlay(Image(systemName: "camera").frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(colorScheme == .dark ? .white.opacity(0.8)  : .black)
                     , alignment: .bottomTrailing)
        
        VStack(alignment:.center,spacing: 10) {
            ReusableButton(title: "SignOut",type:.dark)
            {
              
            }
            
            ReusableButton(title: "Leave Feedback",type:.light) {
                print("feedback button tapped")
                
            }
            ReusableButton(title: "Launch Tour",type: .light) {
                
            }
        }
    }
}
