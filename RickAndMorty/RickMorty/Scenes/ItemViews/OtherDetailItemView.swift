//
//  OtherDetailItemView.swift
//  RickMorty
//
//  Created by Xavi on 19/11/21.
//

import SwiftUI

struct OtherDetailItemView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var titleIcon: String
    var title: String
    var value: String
    
    init(titleIcon: String, title: String, value: String) {
        
        self.titleIcon = titleIcon
        self.title = title
        self.value = value
    }
    
    var body: some View {
        
        HStack {
            
            Text(titleIcon)
                .font(.footnote)
            
            Text(title)
                .foregroundColor(Color("LightBlue"))
                .font(.footnote)
            
            Spacer()
            
            VStack {
                
                Text(value)
                    .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
            }
        }
    }
}

struct OtherDetailItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OtherDetailItemView(titleIcon: "📺", title: "Title", value: "Value")
    }
}
