//
//  TableViewCellPacientePlatosDietaP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCellPacientePlatosDietaP: UITableViewCell {

    @IBOutlet weak var labelPlatoDietaPacienteP: UILabel!
    
    func setPlatos(plato: Platos){
        labelPlatoDietaPacienteP.text = plato.nombre
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
