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
    
    var viewModel = UrunlerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restoranImage.image = UIImage(named: resimAd ?? "pide")
        
        restoranAdLabel.text = restoranAd
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.tumUrunleriGetir(tablo: urunTablo!) { [weak self] in
            self?.tableView.reloadData()
        }

        
    }
    
    
}

extension UrunlerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.urunler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunCell", for: indexPath) as! UrunTableViewCell
        
        cell.urunAdLabel.text = viewModel.urunler[indexPath.row].urunAd
        cell.urunFiyatLabel.text = "₺\(viewModel.urunler[indexPath.row].urunFiyat)"
        cell.urunImageView.image = UIImage(named: "\(viewModel.urunler[indexPath.row].urunImage)")
        cell.urunAciklamaTextView.text = viewModel.urunler[indexPath.row].urunAciklama
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSiparisVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSiparisVC" {
            if let siparisVC = segue.destination as? SiparisViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                siparisVC.urunAciklamaVeri = "\(viewModel.urunler[indexPath.row].urunAciklama)"
                siparisVC.urunAdVeri = "\(viewModel.urunler[indexPath.row].urunAd)"
                siparisVC.urunFiyatVeri = "\(viewModel.urunler[indexPath.row].urunFiyat)"
                siparisVC.urunImageVeri = "\(viewModel.urunler[indexPath.row].urunImage)"
            }
        }
    }
    
}



