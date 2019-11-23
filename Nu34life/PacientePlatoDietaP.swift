//
//  PacientePlatoDietaP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var platosComerPaciente: [Platos] = []
var myPlatoPaciente = 0

class PacientePlatoDietaP: UIViewController {

    @IBOutlet weak var labelDietaDiaP: UILabel!
    @IBOutlet weak var TablePlatosDietaP: UITableView!
    @IBOutlet weak var labelHorarioDietaP: UILabel!
    @IBOutlet weak var labelDiaDietaP: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        platosComerPaciente = []
        TablePlatosDietaP.delegate = self
        TablePlatosDietaP.dataSource = self
        labelDietaDiaP.text = DiasPaciente[myDiaPaciente]
        labelHorarioDietaP.text = HorasPaciente[myHorasPaciente]
       CargarIdPlatos()
    }
    
    private func CargarIdPlatos(){
         
        let delegado = UIApplication.shared.delegate as! AppDelegate
    
    
        let url = delegado.urlServicio + "/plans/patient/" + pacienteLogin.id + "?turn=" + HorasPaciente[myHorasPaciente] + "&day=" + DiasPaciente[myDiaPaciente]
        request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
            (data) in
            switch(data.result){
                case .success( _):
                    
                    let jsons = try! JSON(data: data.data!)
                    jsons.array?.forEach({ (json) in
                    let delegado = UIApplication.shared.delegate as! AppDelegate
                        let idaux:String =  json["recipeId"].stringValue
                        let idPlan:String = json["id"].stringValue
                        
                    let url = delegado.urlServicio + "/recipes"
                    request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
                    (data) in
                    switch(data.result){
                        case .success( _):
                             let jsons = try! JSON(data: data.data!)
                            jsons.array?.forEach({ (json) in
                                if idaux.elementsEqual(json["id"].stringValue){
                                    let platonew = Platos(nombre: json["name"].stringValue, id: json["id"].stringValue,idPlan: idPlan)
                                    platosComerPaciente.append(platonew)
                                }
                            })
                             self.TablePlatosDietaP.reloadData()
                              
                        case .failure(let error):
                            print(error)
                        }
                        })
                        
                    })
                    self.TablePlatosDietaP.reloadData()
                case .failure(let error):
                    print(error)
            }
        })
    
     }
   

}
extension PacientePlatoDietaP: UITableViewDataSource, UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platosComerPaciente.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let plato = platosComerPaciente[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlatoDietaP") as! TableViewCellPacientePlatosDietaP
        cell.setPlatos(plato: plato)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myPlatoPaciente = indexPath.row
        performSegue(withIdentifier: "seguePlatoDietaP", sender: self)
    }
}

