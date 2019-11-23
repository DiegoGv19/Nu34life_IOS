//
//  TableViewCellPacienteDia.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCellPacienteDia: UITableViewCell {

    @IBOutlet weak var labelPacienteDiaP: UILabel!
    
    func setDias(dia: String){
        labelPacienteDiaP.text = dia
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
