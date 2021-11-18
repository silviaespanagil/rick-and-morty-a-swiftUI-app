//
//  CharacterCellView.swift
//  RickMorty
//
//  Created by Silvia España on 18/11/21.
//

import SwiftUI

struct CharacterCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var image: String
    var name: String
    var status: String
    
    let imageSize: CGFloat = 90
    let cornerRadius: CGFloat = 50
    
    let spacing: CGFloat = 10
    
    init(image: String, name: String, status: String) {
        
        self.image = image
        self.name = name
        self.status = status
    }
    
    var body: some View {
        
        HStack {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            VStack(spacing: spacing) {
                
                Text(name)
                    .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if status == "unknown" {
                    Text("Unknown")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    
                    Text(status)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }.padding()
    }
}


struct CharacterCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CharacterCellView(
            image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg",
            name: "Sleepy Gary",
            status: "Alive"
        )
    }
}
