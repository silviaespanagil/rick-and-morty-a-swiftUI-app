//
//  ProgressViewView.swift
//  RickMorty
//
//  Created by Silvia España on 11/11/21.
//

import SwiftUI

struct ProgressViewView: View {
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint:Color("DeepBlue")))
                .id("loader")
            
            Spacer()
        }
    }
}

struct ProgressViewView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProgressViewView()
    }
}
