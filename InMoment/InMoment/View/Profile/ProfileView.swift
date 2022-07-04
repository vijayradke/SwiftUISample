//
//  ProfileView.swift
//  Basics
//
//  Created by Gourav on 13/06/22.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = User()
    
    @State var editing: Bool = false
  
    @State var isNight : Bool = true
    @State var isShowingSheet = false
    @State var txtlang :String = ""
    @State var txtEmail :String = ""
    @State var txtCountryCode :String = ""
    @State var txtPhone :String = ""
    @State var txtCity :String = ""
    
    @State private var showToast = false

    @State var showBottomFloater = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @StateObject private var viewModela = LoginViewModel()

    var body: some View {
        
        CustomNavBar(title: "InMoment", content:
                        
        VStack {
            ProfileInfoView(name:"John Wompey", position: "CEO", dismiss: {
                presentationMode.wrappedValue.dismiss()
            })
            Divider()
            
            List {
                ProfileHeaderView(name:"John Wompey")
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                
                VStack(spacing: 15) {
                    
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                        
                        VStack(spacing: 15) {
                            
                            ReusableTextField(title: "Language", placeHolder: "English", errorMessage: viewModel.inlineLanguageError, textFieldType: .editable, isEdit: { isEditing in
                                // self.editing = isEditing
                            }, field: $viewModel.language)
                            ReusableTextField(title: "Email", placeHolder: "gouravma@cybage.com", errorMessage: viewModel.inlineEmailError, textFieldType: .editable, isEdit: { isEditing in
                                // self.editing = isEditing
                            }, field: $viewModel.email)
                            
                            ReusableTextField(title: "Country code", placeHolder: "United States(1)", errorMessage: viewModel.inlineCountryCodeError, textFieldType: .dropdown, isEdit: { isEditing in
                                self.editing = isEditing
                            }, field:$viewModel.countryCode)
                            
                            
                        }
                        SuggestionTextFieldMenu(names: $viewModel.countries.wrappedValue,editing: $editing, text: $viewModel.countryCode, verticalOffset: -70, horizontalOffset: 0)
                    }
                    
                    ReusableTextField(title: "Phone", placeHolder: "34349345", errorMessage: viewModel.inlinePhoneError, textFieldType: .editable, isEdit: { isEditing in
                        //self.editing = isEditing
                    }, field: $viewModel.phone)
                    ReusableTextField(title: "City", placeHolder: "Salt Lanke City, UT", errorMessage: viewModel.inlineCityError, textFieldType: .dropdown, isEdit: { isEditing in
                        // self.editing = isEditing
                    }, field: $viewModel.city)
                    
                    MomentsButton(title: "Save", type: .save) {
                        showToast.toggle()
                    }
                    .disabled(!$viewModel.isValid.wrappedValue)
                    
                    ProfileFooterView()
                }
                
                
            }
            .padding([.top,.leading,.trailing], 5)
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .listRowBackground(Color.clear)
            
            .toast(isPresenting: $showToast){
                
                // `.alert` is the default displayMode
                //  AlertToast(type: .regular, title: "Message Sent!")
                
                //Choose .hud to toast alert from the top of the screen
                //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
                
                //Choose .banner to slide/pop alert from the bottom of the screen
                AlertToast(displayMode: .banner(.pop),type: .regular, title: "Message Sent!",style: .style(backgroundColor: Color.profileBtnFilled, titleColor: Color.white, subTitleColor: .white, titleFont: Font.iBMPlexSans(.regular, size:  horizontalSizeClass == .regular ? 20 : 18), subTitleFont: Font.iBMPlexSans(.regular, size:  horizontalSizeClass == .regular ? 18 : 14)))
                            }
                    }
                , toolbar:
                Text("")
        )
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func createBottomFloaterView() -> some View {
        HStack(spacing: 15) {
            Image("travel")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 60, height: 60)
                .cornerRadius(10.0)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Ever thought of taking a break from work and travel?")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .lineLimit(3)
                
                Text("If you have ever thought of something like a career break or sabbatical, you need to realize that there will never be a perfect time.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
        }
        .padding(15)
        .frame(width: 350, height: 160)
        .background(.black)
        .cornerRadius(20.0)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
                .previewDevice("iphone 11 ")
            // ProfileView()
            // .previewDevice("iPad (9th generation)")
        }
    }
}

