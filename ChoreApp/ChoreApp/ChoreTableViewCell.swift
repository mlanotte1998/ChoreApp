//
//  ChoreTableViewCell.swift
//  ChoreApp
//
//  Created by William Wallace on 4/13/19.
//  Copyright © 2019 William Wallace. All rights reserved.
//

import UIKit

class ChoreTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
