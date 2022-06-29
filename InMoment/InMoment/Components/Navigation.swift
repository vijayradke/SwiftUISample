//
//  Navigation.swift
//  Basics
//
//  Created by Gourav on 17/06/22.
//

import SwiftUI


struct CustomNavBar<Content,Toolbar>: View where Content: View,Toolbar:View {
    
    let title: String
    let content: Content
    let toolbar:Toolbar
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Color.clear
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.navBarLightColor,.navBarDarkColor]), startPoint: .leading, endPoint: .trailing)
                    )
                    
                  
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 0)
                    
                    Spacer()
                        
                }
                content
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text(title).font(Font.iBMPlexSans(.semiBold, size: 20)))
            .navigationBarTitleTextColor(.white)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    toolbar
                        }
                }
        }
    }
}
