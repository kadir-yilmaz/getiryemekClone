//
//  UrunlerViewModel.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//

import Foundation

class UrunlerViewModel {
    
    var urunler = [Urun]()
    let webService = WebService()
    
    func tumUrunleriGetir(tablo: String, completion: @escaping () -> ()) {
        webService.tumUrunleriGetir(tablo: tablo) {
            self.urunler = self.webService.urunler
            completion()
        }
    }
    
}
