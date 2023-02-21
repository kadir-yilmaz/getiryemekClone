//
//  ViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var restoranlar = [Restoran]()

    
    @IBOutlet weak var kampanyaImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var no = 1
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(noArtır), userInfo: nil, repeats: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tumRestoranlariGetir()
        print(restoranlar)
                
     
        
        
    }
    
    func tumRestoranlariGetir(){
           
           let url = URL(string: "https://kadiryilmazhatay.000webhostapp.com/getiryemekWebService/tumRestoranlariGetir.php")
           
           URLSession.shared.dataTask(with: url!){ data, response, error in
               if error != nil || data == nil {
                   print("Hata")
                   return
               }
               
               do{
                   let cevap = try JSONDecoder().decode(ApiCevap.self, from: data!)
                   if let gelenRestoranListesi = cevap.restoranlar{
                       self.restoranlar = gelenRestoranListesi
                   }
                   DispatchQueue.main.async {
                       self.tableView.reloadData()
                   }
               }catch{
                   print(error.localizedDescription)
               }
               
           }.resume()
           
       }
    
    @objc func noArtır(){
        self.no += 1
        kampanyaImageView.image = UIImage(named: "kampanya\(no)")
        if no == 5 {
            no = 1
        }
    }
    
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restoranlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restoranCell", for: indexPath) as! TableViewCell
        
        cell.restoranAd.text = restoranlar[indexPath.row].restoranAd
        cell.restoranImage.image = UIImage(named: "\(restoranlar[indexPath.row].restoranImage)")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toUrunlerVC", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUrunlerVC" {
            if let urunlerVC = segue.destination as? UrunlerViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let resimAd = "\(restoranlar[indexPath.row].restoranImage)"
                urunlerVC.resimAd = resimAd
            }
        }
    }

    
    
}

