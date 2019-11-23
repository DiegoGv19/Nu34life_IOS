//
//  PacienteHorarioP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
var HorasPaciente = ["Mañana","MedioDia","Tarde","Lonche","Cena"]
var myHorasPaciente = 0
class PacienteHorarioP: UIViewController {

    @IBOutlet weak var TableHorarioPacientePPP: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableHorarioPacientePPP.delegate = self
        TableHorarioPacientePPP.dataSource = self
        // Do any additional setup after loading the view.
    }
    

 

}
extension PacienteHorarioP: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HorasPaciente.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let horariop = HorasPaciente[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPacienteHorarioP") as! TableViewCellPacienteHorario
        cell.setHorario(horario: horariop)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myHorasPaciente = indexPath.row
        performSegue(withIdentifier: "seguePacienteHorarioP", sender: self)
    }
}

