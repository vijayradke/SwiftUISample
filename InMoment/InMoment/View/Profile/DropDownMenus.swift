//
//  DropDownMenus.swift
//  Basics
//
//  Created by Gourav on 29/06/22.
//

import SwiftUI

struct DropDownMenus: View {
    
    @State var editing: Bool = false
    @State var inputText: String = ""
    @State var vOffset: CGFloat = 5
    @State var hOffset: CGFloat = 0
    
    var body: some View {
       
        VStack() {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                VStack(alignment: .center) {
                    
                    Spacer().frame(width: 0, height: 70, alignment: .topLeading)
                    
                    Text("Spacer")
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(14)
                        .padding(.horizontal, 20)
                        
                    
                    Spacer().frame(width: 0, height: 50, alignment: .topLeading)
                    
                   
                    Text("Textfield!")
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
                        .padding(.horizontal, 25)
                        
                }
                SuggestionTextFieldMenu(names: ["A","B"], editing: $editing, text: $inputText, verticalOffset: vOffset, horizontalOffset: hOffset)
            }
            
            Group {
                TextField("Placeholder", text: $inputText, onEditingChanged: { edit in
                            self.editing = edit}).padding(.horizontal, 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
            .background(Color.init(red: 0.98, green: 0.98, blue: 0.98))
            .cornerRadius(14)
            .shadow(radius: 4)
            .padding(.horizontal, 20)
 
           
        }
    }
        
}
struct DropDownMenus_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenus()
    }
}



public struct SuggestionTextFieldMenu: View {
    
    @State var names: [String]
    
   // @ObservedObject var fetch = CountriesViewModel()
  
    @Binding var editing: Bool
    @Binding var inputText: String
    @State var verticalOffset: CGFloat
    @State var horizontalOffset: CGFloat
    
    private var filteredTexts: Binding<[String]> { Binding (
        get: {
            return names.filter { $0.contains(inputText) && $0.prefix(1) == inputText.prefix(1) } },
        set: { _ in })
    }

    
    public init(names:[String],editing: Binding<Bool>, text: Binding<String>) {
        self.names = names
        self._editing = editing
        self._inputText = text
        self.verticalOffset = 0
        self.horizontalOffset = 0
       // print(fetch.countries)
    }
    
    public init(names:[String],editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat) {
        self.names = names
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
       
    }
    
    public var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(filteredTexts.wrappedValue, id: \.self) { textSearched in
                    
                    Text(textSearched)
                        .font(Font.iBMPlexSans(.regular, size: 16))
                        .padding(.horizontal, 25)
                        .padding(.vertical, 25)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: 55,
                               alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            inputText = textSearched
                            editing = false
                            self.endTextEditing()
                        })
                        .background(inputText == textSearched ? Color.dropDownSelectedBg : .white)
                    
                        .if(inputText == textSearched) { view in
                            view
                                .overlay(alignment: .trailing) {
                                Image("checklist").resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(Color.dropDownSelectedIcon)
                                    .padding(.trailing, 20)
                                }
                        }
                    Divider()
                        
                }
            }
        }.background(Color.white)
        
        .cornerRadius(10)
        .foregroundColor(Color(.black))
        .ignoresSafeArea()
        .frame(maxWidth: .infinity,
               minHeight: 0,
               maxHeight: 55 * CGFloat( (filteredTexts.wrappedValue.count > 3 ? 3: filteredTexts.wrappedValue.count)))
        .shadow(radius: 4)
        .padding(.horizontal, 0)
        .offset(x: horizontalOffset, y: verticalOffset)
        .isHidden(!editing, remove: !editing)
        
    }

}


struct SuggestionTextFieldMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatefulPreviewWrapper("lemon") {text in
                VStack {
                    TextField("Title", text: text)
                    SuggestionTextFieldMenu(names: [], editing: .constant(true), text: text)
                }
                
            }
        }
        
    }
}

public extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}






//  StatefulPreviewWrapper.swift
//  SwiftUI Preview can't use @State variabiles, this wrapper let us easily use them.
//
//  Created by Jim Dovey on 10/11/19.
//  Copyright © 2019 Jim Dovey. All rights reserved.
//
//  Copied from https://developer.apple.com/forums/thread/118589?answerId=398579022#398579022

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    public var body: some View {
        content($value)
    }

    public init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
