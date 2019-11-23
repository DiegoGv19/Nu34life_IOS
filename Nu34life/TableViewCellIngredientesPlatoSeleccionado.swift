//
//  TableViewCellIngredientesPlatoSeleccionado.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCellIngredientesPlatoSeleccionado: UITableViewCell {

    @IBOutlet weak var labelIngredientePlatoIII: UILabel!
    
    func setPlatos(ingrediente: String){
        labelIngredientePlatoIII.text = ingrediente
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
