//
//  ViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kampanyaImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var no = 1
    var timer = Timer()
    
    var viewModel = RestoranlarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(noArtır), userInfo: nil, repeats: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.tumRestoranlariGetir {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        
    }
    
    
    @objc func noArtır(){
        self.no += 1
        kampanyaImageView.image = UIImage(named: "kampanya\(no)")
        if no == 4 {
            no = 1
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restoranlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restoranCell", for: indexPath) as! TableViewCell

        cell.restoranAd.text = viewModel.restoranlar[indexPath.row].restoranAd
        /*
         UI resim yüklenirken donar
         
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(viewModel.restoranlar[indexPath.row].restoranImage).jpeg") {
            do {
                let data = try Data(contentsOf: url)
                cell.restoranImage.image = UIImage(data: data)
            } catch let error {
                print("Error getting image data: \(error.localizedDescription)")
            }
        }*/
        
        if let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/images/\(viewModel.restoranlar[indexPath.row].restoranImage).jpeg") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error getting image data: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        cell.restoranImage.image = UIImage(data: data)

                    }
                }
            }
            task.resume()
        }
        
        


        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toUrunlerVC", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUrunlerVC" {
            if let urunlerVC = segue.destination as? UrunlerViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let restoranImage = "\(viewModel.restoranlar[indexPath.row].restoranImage)"
                let restoranTabloAd = "\(viewModel.restoranlar[indexPath.row].restoranTablo)"
                let restoranAd = "\(viewModel.restoranlar[indexPath.row].restoranAd)"
                urunlerVC.resimAd = restoranImage
                urunlerVC.urunTablo = restoranTabloAd
                urunlerVC.restoranAd = restoranAd
            }
        }
    }

}

