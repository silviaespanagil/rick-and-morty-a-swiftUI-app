//
//  ListHeaderView.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import SwiftUI

struct ListHeaderView: View {
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "eyes")
            Text("Click on any cell for further information")
        }
        .font(.system(size: 10))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
