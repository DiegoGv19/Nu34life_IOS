//
//  TableViewCellHoras.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCellHoras: UITableViewCell {
    
    
    @IBOutlet weak var labelHoras: UILabel!
    func setHoras(hora: String){
           labelHoras.text = hora
       }
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
