//
//  PacienteIngredientesP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var ingredientes: [String] = []

class PacienteIngredientesP: UIViewController {

    @IBOutlet weak var labelIngredientePlatoHorario: UILabel!
    @IBOutlet weak var labelIngredientePlatoNombre: UILabel!
    @IBOutlet weak var TableIngredientePlatoI: UITableView!
    @IBOutlet weak var labelIngredientePlatoDia: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientes = []
        TableIngredientePlatoI.delegate = self
        TableIngredientePlatoI.dataSource = self
        labelIngredientePlatoDia.text = DiasPaciente[myDiaPaciente]
        labelIngredientePlatoHorario.text = HorasPaciente[myHorasPaciente]
        labelIngredientePlatoNombre.text = platosComerPaciente[myPlatoPaciente].nombre
        CargarIngredientes()
    }
    private func CargarIngredientes(){
         
         let delegado = UIApplication.shared.delegate as! AppDelegate
      let url = delegado.urlServicio + "/recipes/" + platosComerPaciente[myPlatoPaciente].id + "/ingredients"
          request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
                     (data) in
                     switch(data.result){
                        case .success( _):
                            let jsons = try! JSON(data: data.data!)
                            jsons.array?.forEach({ (json) in
                                ingredientes.append(json["food"].stringValue + "  " + json["quantity"].stringValue + " " + json["unit"].stringValue)
                            })
                            self.TableIngredientePlatoI.reloadData()
                   
                        case .failure(let error):
                         print(error)
                     }
                 })
     }
//

   
}
extension PacienteIngredientesP: UITableViewDataSource, UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let ingrediente = ingredientes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIngredientesPlatoSeleccionadoI") as! TableViewCellIngredientesPlatoSeleccionado
        cell.setPlatos(ingrediente: ingrediente)
        return cell
        
    }
    
    
}

