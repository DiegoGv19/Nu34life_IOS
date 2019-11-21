//
//  TableViewCellHorarios.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TableViewCellHorarios: UITableViewCell {

    
    @IBOutlet weak var labelDias: UILabel!
    
    func setDias(dia: String){
          labelDias.text = dia
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

    

}
