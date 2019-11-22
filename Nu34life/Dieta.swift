//
//  Dieta.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


var platosComer: [Platos] = []
var myPlato = 0

class Dieta: UIViewController {

    @IBOutlet weak var labelDia: UILabel!
    @IBOutlet weak var labelHorario: UILabel!
    @IBOutlet weak var TablaPlatosDieta: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        platosComer = []
       
        labelDia.text = Dias[myDia]
        labelHorario.text = Horas[myHoras]
        
        
        CargarIdPlatos()
        TablaPlatosDieta.delegate = self
        TablaPlatosDieta.dataSource = self
    }
    

   private func CargarIdPlatos(){
         
        let delegado = UIApplication.shared.delegate as! AppDelegate
    
    
        let url = delegado.urlServicio + "/plans/patient/" + pacientes[myIndex].id + "?turn=" + Horas[myHoras] + "&day=" + Dias[myDia]
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
                                    platosComer.append(platonew)
                                }
                            })
                             self.TablaPlatosDieta.reloadData()
                              
                        case .failure(let error):
                            print(error)
                        }
                        })
                        
                    })
                    self.TablaPlatosDieta.reloadData()
                case .failure(let error):
                    print(error)
            }
        })
    
     }
    

}



extension Dieta: UITableViewDataSource, UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platosComer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let plato = platosComer[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlato") as! TableViewCellPlatos
        cell.setPlatos(plato: plato)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myPlato = indexPath.row
        performSegue(withIdentifier: "seguePlato", sender: self)
    }
}

