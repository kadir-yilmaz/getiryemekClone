//
//  TableViewCell.swift
//  getiryemekClone
//
//  Created by Kadir Yılmaz on 21.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var restoranAd: UILabel!
    
    @IBOutlet weak var restoranImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
