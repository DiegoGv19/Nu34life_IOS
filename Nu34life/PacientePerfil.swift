//
//  PasientePerfil.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit

class PacientePerfil: UIViewController {

    @IBOutlet weak var labelPacienteContraseñaP: UILabel!
    @IBOutlet weak var labelPacienteFechaP: UILabel!
    @IBOutlet weak var labelPacienteCorreoP: UILabel!
    @IBOutlet weak var labelPacienteApellidoP: UILabel!
    @IBOutlet weak var labelPacienteNombreP: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelPacienteFechaP.text = pacienteLogin.birthdate
        labelPacienteCorreoP.text = pacienteLogin.email
        labelPacienteNombreP.text = pacienteLogin.name
        labelPacienteContraseñaP.text = pacienteLogin.password
        labelPacienteApellidoP.text = pacienteLogin.lastName
        
    }
    

   
}
