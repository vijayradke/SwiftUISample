//
//  ProfileHeader.swift
//  InMoment
//
//  Created by Gourav on 30/06/22.
//

import SwiftUI

struct ProfileHeader: View {
    
    var name:String
    
   let profileImage = "https://picsum.photos/200/300?random=1"
   @Environment(\.horizontalSizeClass) var horizontalSizeClass
   @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        HStack(spacing:10) {
           
           let circleWidth: CGFloat = horizontalSizeClass == .regular ? 150 : 130
           
               AsyncImage(url: URL(string: profileImage)) { image in
                   image.resizable()
               } placeholder: {
                   Text(name.getFirstChar()).frame(width: circleWidth, height: circleWidth)
                       .font(Font.iBMPlexSans(.regular, size: 60))
                       .foregroundColor(colorScheme == .dark ? .black : .white)
                       .background(colorScheme == .dark ? .white.opacity(0.8)  : .black)
               }
               .frame(width: circleWidth, height: circleWidth)
               .clipShape(Circle())
           
           VStack(alignment:.center,spacing: 10) {
               
               MomentsFilledButton(title: "SignOut") {
                   print("SignOut clicked")
               }
               
               MomentsWhiteButton(title: "Leave Feedback") {
                   print("feedback button tapped")
               }
               
               MomentsWhiteButton(title: "Launch Tour") {
                   print("Launch Tour")
               }
               
           }
       }.padding(.horizontal,horizontalSizeClass == .regular ? 50 : 0)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(name:"Gourav")
    }
}
