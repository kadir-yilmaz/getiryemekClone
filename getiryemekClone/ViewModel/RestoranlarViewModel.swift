//
//  RestoranlarViewModel.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//


import Foundation

class RestoranlarViewModel {
    
    var restoranlar = [Restoran]()
    let webService = WebService()
    
    func tumRestoranlariGetir(completion: @escaping () -> Void) {
        webService.tumRestoranlariGetir {
            self.restoranlar = self.webService.restoranlar
            completion()
        }
    }
    
}

