//
//  SiparisViewController.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//

import UIKit

class SiparisViewController: UIViewController {
    
    var urunAdVeri: String?
    var urunFiyatVeri: String?
    var urunAciklamaVeri: String?
    var urunImageVeri: String?
    
    var urunAdet: String?
    @IBOutlet weak var adetStepper: UIStepper!
    
    
    
    @IBOutlet weak var urunImage: UIImageView!
    
    
    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunAciklamaTextView: UITextView!
    
    @IBOutlet weak var urunAdetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        urunAdLabel.text = urunAdVeri
        urunImage.image = UIImage(named: "\(urunImageVeri!)")
        urunFiyatLabel.text = "₺\(urunFiyatVeri!)"
        urunAciklamaTextView.text = urunAciklamaVeri
    }
    
    
    @IBAction func sepeteEkle(_ sender: Any) {
        
        urunAdet = String(Int(adetStepper.value))
        
        let urun = Urun(urunId: "1", urunAd: urunAdVeri!, urunImage: urunImageVeri!, urunAciklama: urunAciklamaVeri!, urunFiyat: urunFiyatVeri!, urunAdet: urunAdet!)
        
        SepetViewController.sepettekiler.append(urun)
        
        
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    @IBAction func adetStepper(_ sender: UIStepper) {
        urunAdetLabel.text = "\(Int(sender.value))"
    }
}
