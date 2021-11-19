//
//  LocationCellView.swift
//  RickMorty
//
//  Created by Silvia España on 18/11/21.
//

import SwiftUI

struct OtherCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var name: String
    var infoA: String
    var infoB: String
    
    var dimensionText = "Dimension: "
    
    let spacing: CGFloat = 10
    
    init(name: String, infoA: String, infoB: String) {
        
        self.name = name
        self.infoA = infoA
        self.infoB = infoB
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: spacing) {
            
            Spacer()
            
            Text(name)
                .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
            
            VStack(alignment: .leading) {
                
                Text(infoA)
                
                if infoB == "unknown" {
                    
                    Text("\(dimensionText)Unknown")
                } else {
                    
                    Text("\(dimensionText)\(infoB)")
                }
            }
            .font(.footnote)
            .foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
            Spacer()
        }
    }
}

struct OtherCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OtherCellView(
            name: "Earth",
            infoA: "Planet",
            infoB: "Unknown")
    }
}
