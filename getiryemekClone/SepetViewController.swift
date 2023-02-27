//
//  SepetViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//

import UIKit

class SepetViewController: UIViewController {
    
    static var sepettekiler = [Urun]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SepetViewController.sepettekiler)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func siparisVer(_ sender: Any) {
        
        performSegue(withIdentifier: "toSiparisOnayVC", sender: nil)
        
    }
    
}

extension SepetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SepetViewController.sepettekiler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetCell", for: indexPath) as! SepetTableViewCell
        
        cell.urunAdLabel.text = SepetViewController.sepettekiler[indexPath.row].urunAd
        cell.urunFiyatLabel.text = SepetViewController.sepettekiler[indexPath.row].urunFiyat
        
        return cell
        
    }
    
    
    
}
