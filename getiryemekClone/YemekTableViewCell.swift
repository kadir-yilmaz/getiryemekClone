//
//  YemekTableViewCell.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var yemekAd: UILabel!
    
    @IBOutlet weak var yemekAciklama: UITextView!
    
    @IBOutlet weak var yemekFiyat: UILabel!
    
    @IBOutlet weak var yemekImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
