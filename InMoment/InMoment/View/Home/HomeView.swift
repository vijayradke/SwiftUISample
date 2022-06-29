//
//  HomeView.swift
//  Basics
//
//  Created by Gourav on 16/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        TabView {
            CustomNavBar(title: "inMoment", content:
                        
                Text("Feed")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                         
                , toolbar:
                        HStack {
                        Spacer()
                    Button(action: {
                      
                    
                    }) {
                    Image(systemName: "")
                    
                }
                .foregroundColor(Color.white)
               
            })
            .tabItem {
                Image(systemName: "house.fill")
                Text("Feed")
            }
            
            
            CustomNavBar(title: "inMoment", content:
                            Text("Analytics")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                         ,  toolbar:
                            HStack {
                Spacer()
                Button(action: {
                    
                
                }) {
                    Image(systemName: "")
                    
                }
                .disabled(true)
                .foregroundColor(Color.white)
             
            })
            .tabItem {
                Image(systemName: "manatsign.square")
                Text("Analytics")
            }
            
            CustomNavBar(title: "inMoment", content:
                        
                         Text("Collection")
                     .font(.system(size: 30, weight: .bold, design: .rounded))
                         ,  toolbar:
                            HStack {
                Spacer()
                Button(action: {
                    isPresented.toggle()
                    
                }) {
                    Image(systemName: "person.crop.circle")
                    
                }
                .foregroundColor(Color.white)
                .fullScreenCover(isPresented: $isPresented, content: ProfileView.init)
            })
            .tabItem {
                
                Image(systemName: "filemenu.and.selection")
                Text("Menu")
            }
            .tint(Color.accentColor)
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
