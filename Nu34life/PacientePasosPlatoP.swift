//
//  PacientePasosPlatoP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var pasos: [String] = []
class PacientePasosPlatoP: UIViewController {

    @IBOutlet weak var labelPasosNombre: UILabel!
    @IBOutlet weak var labelPasosHorario: UILabel!
    @IBOutlet weak var labelPasosDia: UILabel!
    @IBOutlet weak var TablePasosPaciente: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pasos = []
        TablePasosPaciente.delegate = self
        TablePasosPaciente.dataSource = self
        labelPasosDia.text = DiasPaciente[myDiaPaciente]
        labelPasosHorario.text = HorasPaciente[myHorasPaciente]
        labelPasosNombre.text = platosComerPaciente[myPlatoPaciente].nombre
        CargarPasos()
    }
        private func CargarPasos(){
             
             let delegado = UIApplication.shared.delegate as! AppDelegate
          let url = delegado.urlServicio + "/recipes/" + platosComerPaciente[myPlatoPaciente].id + "/steps"
              request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
                         (data) in
                         switch(data.result){
                            case .success( _):
                                let jsons = try! JSON(data: data.data!)
                                jsons.array?.forEach({ (json) in
                                    pasos.append(json["stepNumber"].stringValue + ") " + json["instruction"].stringValue )
                                })
                                self.TablePasosPaciente.reloadData()
                                print(pasos)
                                print("asduakhkdas")
                            case .failure(let error):
                             print(error)
                         }
                     })
         }
    //


   
}
extension PacientePasosPlatoP: UITableViewDataSource, UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pasos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let paso = pasos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPasosPaciente") as! TableViewCellPasosPaciente
        cell.setPaso(paso: paso)
        return cell
        
    }
    
    
}
