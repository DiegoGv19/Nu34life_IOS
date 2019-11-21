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
    var platos: [Platos] = []

    @IBOutlet weak var labelDia: UILabel!
    @IBOutlet weak var labelHorario: UILabel!
    @IBOutlet weak var TablaPlatosDieta: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        platosComer = []
       
        labelDia.text = Dias[myDia]
        labelHorario.text = Horas[myHoras]
        TablaPlatosDieta.delegate = self
        TablaPlatosDieta.dataSource = self
        
        CargarIdPlatos()
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
            let delegadod = UIApplication.shared.delegate as! AppDelegate
            let url = delegadod.urlServicio + "/recipes/" + json["recipeId"].stringValue
            request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseJSON(completionHandler: {(data) in
                switch(data.result){
                    case .success( _):
                        let jsond = try! JSON(data: data.data!)
                        let platonew = Platos(nombre: jsond["name"].stringValue, id: json["recipeId"].stringValue)
                        self.platos.append(platonew)

                    case .failure(let error):
                            print(error)
                        }
                        })
            })
            platosComer = self.platos
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

