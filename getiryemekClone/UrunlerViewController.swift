//
//  UrunlerViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class UrunlerViewController: UIViewController {
    
    var resimAd: String?
    
    @IBOutlet weak var restoranImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var urunler = [Urun]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restoranImage.image = UIImage(named: resimAd ?? "pide")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let u1 = Urun(urunId: "1", urunAd: "Sucuklu Pide", urunImage: "pide", urunAciklama: "Bol sucuklu pide.", urunFiyat: "120TL")
        
        urunler.append(u1)
        urunler.append(u1)
        urunler.append(u1)
        urunler.append(u1)
        urunler.append(u1)
    }
    
}

extension UrunlerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekCell", for: indexPath) as! YemekTableViewCell
        
        cell.yemekAd.text = urunler[indexPath.row].urunAd
        cell.yemekFiyat.text = urunler[indexPath.row].urunFiyat
        cell.yemekImage.image = UIImage(named: "pide")
        cell.yemekAciklama.text = urunler[indexPath.row].urunAciklama
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("sepete ekle ekranına geçiliyor")

    }
}
