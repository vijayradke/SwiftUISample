//
//  ProfileHeader.swift
//  InMoment
//
//  Created by Gourav on 30/06/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var name:String
    
   let profileImage = "https://picsum.photos/200/300?random=1"
   @Environment(\.horizontalSizeClass) var horizontalSizeClass
   @Environment(\.colorScheme) var colorScheme
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        
        HStack(spacing:20) {
        
              let circleWidth: CGFloat = horizontalSizeClass == .regular ? 150 : 130
           
               AsyncImage(url: URL(string: profileImage)) { image in
                   image.resizable()
               } placeholder: {
                   Text(name.getFirstChar()).frame(width: circleWidth, height: circleWidth)
                       .font(Font.iBMPlexSans(.regular, size: 60))
                       .foregroundColor(colorScheme == .dark ? .black : .white)
                       .background(Color.profileBtnFilled)
               }
               .frame(width: circleWidth, height: circleWidth)
               .clipShape(Circle())
               .overlay(
                Button(action: {
                    //showSheet = true
                }, label: {
                    Image("photo-camera")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                })
                , alignment: .bottomTrailing)
               
           VStack(alignment:.center,spacing: 10) {
               
               MomentsButton(title: "SignOut",type: .filled, action:  {
                   print("SignOut clicked")
               })
               
               MomentsButton(title: "Leave Feedback",type: .bordered) {
                   print("feedback button tapped")
               }
               
               MomentsButton(title: "Launch Tour",type: .bordered) {
                   print("Launch Tour")
               }
               
           }
       }.padding(.horizontal,horizontalSizeClass == .regular ? 50 : 0)
            .sheet(isPresented: $showSheet) {
                            // Pick an image from the photo library:
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                            //  If you wish to take a photo from camera instead:
                            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                    }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(name:"Gourav")
            .previewLayout(.sizeThatFits)
    }
}
