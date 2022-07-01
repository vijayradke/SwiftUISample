//
//  ProfileInfo.swift
//  InMoment
//
//  Created by Gourav on 30/06/22.
//

import SwiftUI

struct ProfileInfo: View {
    
    var name:String
    var position:String
    
    var dismiss: (() -> Void)
    
    var body: some View {
       
        return HStack() {
            VStack{
                Text(name).font(Font.iBMPlexSans(.semiBold, size: 20))
                
                Text(position).foregroundColor(Color.gray)
                    .font(Font.iBMPlexSans(.regular, size: 14))
            }.padding(.all, 10.0)
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .leading, content: {
            Button {
                dismiss()
           
            } label: {
                Image("left-Arrow")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding(.leading, 15)
        })
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo(name: "David", position: "CEO", dismiss: {
            
        })
            .previewLayout(.fixed(width: 400.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
