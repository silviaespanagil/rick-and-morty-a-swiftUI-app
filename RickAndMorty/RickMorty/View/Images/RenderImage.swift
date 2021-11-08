//
//  RenderImage.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import SwiftUI

extension Image {
    
    func renderImage(url:URL) -> Self {
        
        if let image = try? Data(contentsOf: url) {
            
            return Image(uiImage: UIImage(data: image)!)
                .resizable()
        }
        
        return self
            .resizable()
    }
}
