//
//  RenderImage.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import SwiftUI

struct RenderImage: View {

    let imageUrlString: String
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: imageUrlString)) { phase in
                
                switch phase {
                    
                case .empty:
                    ProgressView()
                    
                case .success(let image):
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 60, maxHeight: 60)
                         .clipShape(RoundedRectangle(cornerRadius: 60))
                         .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    
                case .failure:
                    Image("noImageAvailable")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 60, maxHeight: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 60))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
