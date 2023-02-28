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
        
        
        
        restoranAdLabel.text = restoranAd
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.tumUrunleriGetir(tablo: urunTablo!) { [weak self] in
            self?.tableView.reloadData()
        }
        /*
         UI resim yüklenirken donar
         
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(resimAd!).jpeg") {
            do {
                let data = try Data(contentsOf: url)
                restoranImage.image = UIImage(data: data)
            } catch let error {
                print("Error getting image data: \(error.localizedDescription)")
            }
        }*/
        
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(resimAd!).jpeg") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error getting image data: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        self.restoranImage.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
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
        /*
         UI resim yüklenirken donar
         
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(viewModel.urunler[indexPath.row].urunImage).jpeg") {
            do {
                let data = try Data(contentsOf: url)
                cell.urunImageView.image = UIImage(data: data)
            } catch let error {
                print("Error getting image data: \(error.localizedDescription)")
            }
        }*/
        
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(resimAd!).jpeg") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error getting image data: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        cell.urunImageView.image = UIImage(data: data)

                    }
                }
            }
            task.resume()
        }
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



