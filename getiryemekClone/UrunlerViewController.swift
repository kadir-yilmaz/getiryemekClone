//
//  UrunlerViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class UrunlerViewController: UIViewController {
    
    var resimAd: String?
    var urunTablo: String?
    var restoranAd: String?
    
    @IBOutlet weak var restoranImage: UIImageView!
    
    @IBOutlet weak var restoranAdLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var urunler = [Urun]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restoranImage.image = UIImage(named: resimAd ?? "pide")
        
        restoranAdLabel.text = restoranAd
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tumUrunleriGetir(tablo: "\(urunTablo!)")
        
        
    }
    
    func tumUrunleriGetir(tablo: String) {
        guard let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/tumUrunleriGetir.php?tablo=\(tablo)") else { return }
        
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
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    
}

extension UrunlerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunCell", for: indexPath) as! UrunTableViewCell
        
        cell.urunAdLabel.text = urunler[indexPath.row].urunAd
        cell.urunFiyatLabel.text = "₺\(urunler[indexPath.row].urunFiyat)"
        cell.urunImageView.image = UIImage(named: "\(urunler[indexPath.row].urunImage)")
        cell.urunAciklamaTextView.text = urunler[indexPath.row].urunAciklama
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSiparisVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSiparisVC" {
            if let siparisVC = segue.destination as? SiparisViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                siparisVC.urunAciklamaVeri = "\(urunler[indexPath.row].urunAciklama)"
                siparisVC.urunAdVeri = "\(urunler[indexPath.row].urunAd)"
                siparisVC.urunFiyatVeri = "\(urunler[indexPath.row].urunFiyat)"
                siparisVC.urunImageVeri = "\(urunler[indexPath.row].urunImage)"
            }
        }
    }
}

