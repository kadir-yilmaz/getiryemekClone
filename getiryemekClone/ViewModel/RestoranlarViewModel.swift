//
//  RestoranlarViewModel.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//


import Foundation

class RestoranlarViewModel {
    
    var restoranlar = [Restoran]()
    
    func tumRestoranlariGetir(completion: @escaping () -> Void) {
        let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/tumRestoranlariGetir.php")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do{
                let cevap = try JSONDecoder().decode(ApiCevap.self, from: data!)
                if let gelenRestoranListesi = cevap.restoranlar{
                    self.restoranlar = gelenRestoranListesi
                }
                completion()
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
