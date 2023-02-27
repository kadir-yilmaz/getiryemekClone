//
//  SepetTableViewCell.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 27.02.2023.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var urunAdLabel: UILabel!
    
    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    
    @IBOutlet weak var urunAdetLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func urunAdetStepper(_ sender: UIStepper) {
        urunAdetLabel.text = "\(Int(sender.value))"
    }
    
}
