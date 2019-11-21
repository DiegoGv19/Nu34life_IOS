//
//  TablePaciente.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/18/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class TablePaciente: UITableViewCell {

    @IBOutlet weak var lbDatos: UILabel!
    
    func setPaciente(paciente: Paciente){
        lbDatos.text = paciente.name + "  " + paciente.lastName
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
