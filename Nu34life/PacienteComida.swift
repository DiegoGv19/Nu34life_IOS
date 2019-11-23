//
//  PacienteComida.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
var DiasPaciente = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Dimingo"]
var myDiaPaciente = 0

class PacienteComida: UIViewController {

    @IBOutlet weak var TablaPacienteDias: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TablaPacienteDias.delegate = self
        TablaPacienteDias.dataSource = self
       
    }
    

}
extension PacienteComida: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DiasPaciente.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let dia = DiasPaciente[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDiasPaciente") as! TableViewCellPacienteDia
        cell.setDias(dia: dia)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myDiaPaciente = indexPath.row
        performSegue(withIdentifier: "seguePacienteDias", sender: self)
    }
}

