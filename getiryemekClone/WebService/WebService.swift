//
//  WebService.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import Foundation

class WebService{
    
    var restoranlar = [Restoran]()
    var urunler = [Urun]()
    
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
