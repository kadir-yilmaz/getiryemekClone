//
//  UrunTableViewCell.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 26.02.2023.
//

import UIKit

class UrunTableViewCell: UITableViewCell {

    @IBOutlet weak var urunAdLabel: UILabel!
    
    
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunImageView: UIImageView!
    
    @IBOutlet weak var urunAciklamaTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
