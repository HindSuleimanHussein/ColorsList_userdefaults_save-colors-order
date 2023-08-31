//
//  ColorTableViewCell.swift
//  ColorsTask
//
//  Created by Foothill on 31/08/2023.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
