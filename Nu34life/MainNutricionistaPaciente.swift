//
//  MainNutricionistaPaciente.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var state = State(glucose: "", height: "", weight: "")

class MainNutricionistaPaciente: UIViewController {

    @IBOutlet weak var labelGlucosa: UILabel!
    @IBOutlet weak var labelTalla: UILabel!
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var lbmomentanio: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lbmomentanio.text = pacientes[myIndex].name + "  " + pacientes[myIndex].lastName

        CargarPacientes()
        
        
    }
    
    
  
    private func CargarPacientes(){
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/states?idPatient=" + pacientes[myIndex].id
        
            request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                .responseJSON(completionHandler: {
                    (data) in
                    switch(data.result){
                    case .success( _):
                        let json = try! JSON(data: data.data!)
                        let statenew = State(glucose:json["glucose"].stringValue,height:json["height"].stringValue,weight:json["weight"].stringValue)
                            state = statenew
                            print(statenew)
                        self.labelPeso.text = state.weight + "  kg"
                        self.labelTalla.text = state.height + "  cm"
                        self.labelGlucosa.text = state.glucose + "  mg/dl"
                    
                    case .failure(let error):
                        print(error)
                    }
                })
    }
    
    
    

}
