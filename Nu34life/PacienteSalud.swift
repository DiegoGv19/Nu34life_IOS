//
//  PacienteSalud.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class PacienteSalud: UIViewController {

    @IBOutlet weak var labelPesoP: UILabel!
    @IBOutlet weak var labelNombreP: UILabel!
    @IBOutlet weak var labelTallaP: UILabel!
    @IBOutlet weak var labelGlucosaP: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNombreP.text = pacienteLogin.name + "  " + pacienteLogin.lastName
        CargarPacientes()
    }
    

   private func CargarPacientes(){
       
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/states?idPatient=" + pacienteLogin.id
       
           request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
               .responseJSON(completionHandler: {
                   (data) in
                   switch(data.result){
                   case .success( _):
                       let json = try! JSON(data: data.data!)
                       let statenew = State(glucose:json["glucose"].stringValue,height:json["height"].stringValue,weight:json["weight"].stringValue)
                           state = statenew
                           print(statenew)
                       self.labelPesoP.text = state.weight + "  kg"
                       self.labelTallaP.text = state.height + "  cm"
                       self.labelGlucosaP.text = state.glucose + "  mg/dl"
                   
                   case .failure(let error):
                       print(error)
                   }
               })
   }

}
