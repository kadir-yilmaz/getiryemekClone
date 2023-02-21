//
//  Restoran.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import Foundation

class Restoran: Codable{
    var restoranId: String
    var restoranAd: String
    var restoranImage: String
    
    init(restoranId: String, restoranAd: String, restoranImage: String) {
        self.restoranId = restoranId
        self.restoranAd = restoranAd
        self.restoranImage = restoranImage
    }
}
