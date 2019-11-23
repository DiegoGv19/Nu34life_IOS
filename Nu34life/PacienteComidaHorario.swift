//
//  PacienteComidaHorario.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit


class PacienteComidaHorario: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  TablePacienteHorarioP.delegate = self
        TablePacienteHorarioP.dataSource = self*/
    }



}
/*
extension PacienteComidaHorario: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HorasPaciente.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let horario = HorasPaciente[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPacienteHorarioP") as! TableViewCellPacienteHorario
        cell.setHorario(horario: horario)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myHorasPaciente = indexPath.row
        performSegue(withIdentifier: "seguePacienteHorarioP", sender: self)
    }
}
*/
