//
//  LocationCellView.swift
//  RickMorty
//
//  Created by Silvia España on 18/11/21.
//

import SwiftUI

struct LocationCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var name: String
    var type: String
    var dimension: String
    
    var dimensionText = "Dimension: "
    
    let spacing: CGFloat = 10
    
    init(name: String, type: String, dimension: String) {
        
        self.name = name
        self.type = type
        self.dimension = dimension
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: spacing) {
            
            Spacer()
            
            Text(name)
                .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
            
            VStack(alignment: .leading) {
                
                Text(type)
                
                if dimension == "unknown" {
                    
                    Text("\(dimensionText)Unknown")
                } else {
                    
                    Text("\(dimensionText)\(dimension)")
                }
            }
            .font(.footnote)
            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
            Spacer()
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LocationCellView(
            name: "Earth",
            type: "Planet",
            dimension: "Unknown")
    }
}
