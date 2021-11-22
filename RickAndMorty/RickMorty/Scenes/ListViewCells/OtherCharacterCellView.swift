//
//  OtherCharacterCellView.swift
//  RickMorty
//
//  Created by Xavi on 22/11/21.
//

import SwiftUI

struct OtherCharacterCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var image: String
    var name: String
    var titleA: String
    var subtitleA: String
    var titleB: String
    var subtitleB: String
    
    let imageSize: CGFloat = 90
    let cornerRadius: CGFloat = 50
    
    let spacing: CGFloat = 10
    
    init(image: String, name: String, titleA: String, subtitleA: String, titleB: String, subtitleB: String) {
        
        self.image = image
        self.name = name
        self.titleA = titleA
        self.subtitleA = subtitleA
        self.titleB = titleB
        self.subtitleB = subtitleB
    }
    
    var body: some View {
        
        HStack{
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            Text(name)
                .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
            
            Spacer()
            
            VStack(alignment: .trailing) {
                
                Text(titleA)
                
                Text(subtitleA)
                
                Divider().frame(maxWidth: 40)
                
                Text(titleB)
                
                Text(subtitleB)
            }
            .font(.footnote)
            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue")).multilineTextAlignment(.trailing)
        }
    }
}

struct OtherCharacterCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OtherCharacterCellView(image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg",
                               name: "name",
                               titleA: "Title A",
                               subtitleA: "Subtitle A",
                               titleB: "Title B",
                               subtitleB: "Subtitle B")
    }
}
