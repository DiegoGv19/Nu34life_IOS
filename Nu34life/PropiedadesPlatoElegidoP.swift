//
//  PropiedadesPlatoElegidoP.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class PropiedadesPlatoElegidoP: UIViewController {

    @IBOutlet weak var labelDiaPropiedadePEP: UILabel!
    @IBOutlet weak var labelPlatoElegidoPropiedadePEP: UILabel!
    @IBOutlet weak var labelHorarioPropiedadePEP: UILabel!
    @IBOutlet weak var labelTotalPEP: UILabel!
    @IBOutlet weak var labelSaturatedPEP: UILabel!
    @IBOutlet weak var labelAzucarPEP: UILabel!
    @IBOutlet weak var labelSalPEP: UILabel!
    @IBOutlet weak var labelEnergiaPEP: UILabel!
    @IBOutlet weak var labelProteinasPEP: UILabel!
    @IBOutlet weak var labelCarbohidratosPEP: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelDiaPropiedadePEP.text = DiasPaciente[myDiaPaciente]
        labelHorarioPropiedadePEP.text = HorasPaciente[myHorasPaciente]
        labelPlatoElegidoPropiedadePEP.text = platosComerPaciente[myPlatoPaciente].nombre
        CargarNutrientes()
    }
    
    private func CargarNutrientes(){
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
     let url = delegado.urlServicio + "/recipes/" + platosComerPaciente[myPlatoPaciente].id + "/nutri"
         request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {
                    (data) in
                    switch(data.result){
                    case .success( _):
                        let json = try! JSON(data: data.data!)
                        
                        self.labelCarbohidratosPEP.text = json["carbohydrates"].stringValue
                        self.labelEnergiaPEP.text = json["energeticValue"].stringValue
                        self.labelSalPEP.text = json["salt"].stringValue
                        self.labelAzucarPEP.text = json["sugars"].stringValue
                        self.labelTotalPEP.text = json["totalFat"].stringValue
                        self.labelProteinasPEP.text = json["protein"].stringValue
                        self.labelSaturatedPEP.text = json["saturatedFats"].stringValue
                  
                    case .failure(let error):
                        print(error)
                    }
                })
    }


}
