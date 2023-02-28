//
//  Urun.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import Foundation

class Urun: Codable {
    
    var urunId: String
    var urunAd: String
    var urunImage: String
    var urunAciklama: String
    var urunFiyat: String
    var urunAdet: String
    
    init(urunId: String, urunAd: String, urunImage: String, urunAciklama: String, urunFiyat: String, urunAdet: String) {
        self.urunId = urunId
        self.urunAd = urunAd
        self.urunImage = urunImage
        self.urunAciklama = urunAciklama
        self.urunFiyat = urunFiyat
        self.urunAdet = urunAdet
    }
}
