//
//  UrunlerViewModel.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//

import Foundation

class UrunlerViewModel {
    
    var resimAd: String?
    var urunTablo: String?
    var restoranAd: String?
    
    var urunler = [Urun]()
    
    func tumUrunleriGetir(tablo: String, completion: @escaping () -> ()) {
        guard let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/tumUrunleriGetir.php?tablo=\(tablo)") else {
            print("URL nil oldu")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do {
                let cevap = try JSONDecoder().decode(ApiCevap2.self, from: data!)
                if let gelenUrunListesi = cevap.urunler {
                    self.urunler = gelenUrunListesi
                }
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    
    
}
