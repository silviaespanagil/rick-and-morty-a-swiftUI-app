//
//  String+CapitalizeFirstLetter.swift
//  RickMorty
//
//  Created by Xavi on 19/11/21.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
