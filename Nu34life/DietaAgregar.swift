//
//  DietaAgregar.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var platosAgregar: [Platos] = []
var myPlatoAgregar = 0

class DietaAgregar: UIViewController {

    @IBOutlet weak var labelDia: UILabel!
    @IBOutlet weak var labelHora: UILabel!
    @IBOutlet weak var TablePlatos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        platosAgregar = []
        
         labelDia.text = Dias[myDia]
         labelHora.text = Horas[myHoras]
         
         CargarIdPlatos()
        
        TablePlatos.delegate = self
        TablePlatos.dataSource = self
        
    }
    

      private func CargarIdPlatos(){
           
      let delegado = UIApplication.shared.delegate as! AppDelegate
      
      
      let url = delegado.urlServicio + "/recipes"
      request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
      (data) in
      switch(data.result){
          case .success( _):
               let jsons = try! JSON(data: data.data!)
              jsons.array?.forEach({ (json) in
                let platonew = Platos(nombre: json["name"].stringValue, id: json["id"].stringValue,idPlan: "")
                    platosAgregar.append(platonew)
              })
               self.TablePlatos.reloadData()
                
          case .failure(let error):
              print(error)
          }
          })
      
       }
    
  

}


extension DietaAgregar: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platosAgregar.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let plato = platosAgregar[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlatoAgregar") as! TableViewCellPlatos
        cell.setPlatos(plato: plato)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myPlatoAgregar = indexPath.row
        performSegue(withIdentifier: "seguePlatoAgregar", sender: self)
    }
}

