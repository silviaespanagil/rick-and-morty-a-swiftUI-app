//
//  ProgressViewView.swift
//  RickMorty
//
//  Created by Silvia España on 11/11/21.
//

import SwiftUI

struct ProgressViewView: View {
    var body: some View {
        
        ProgressView()
            
            .progressViewStyle(CircularProgressViewStyle(tint:Color("DeepBlue")))
    }
}

struct ProgressViewView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewView()
    }
}
