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
    var restoranTablo: String
    
    init(restoranId: String, restoranAd: String, restoranImage: String, restoranTablo: String) {
        self.restoranId = restoranId
        self.restoranAd = restoranAd
        self.restoranImage = restoranImage
        self.restoranTablo = restoranTablo
    }
}
