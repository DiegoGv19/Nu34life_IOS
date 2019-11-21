//
//  TableViewCell.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/18/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var txtDescripcion: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }	

}



