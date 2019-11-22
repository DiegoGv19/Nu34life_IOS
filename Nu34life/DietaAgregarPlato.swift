//
//  DietaAgregarPlato.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/21/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class DietaAgregarPlato: UIViewController {


   
    @IBOutlet weak var labelSalt: UILabel!
    @IBOutlet weak var labelSugars: UILabel!
    @IBOutlet weak var labelSaturatedFats: UILabel!
    @IBOutlet weak var labelTotalFat: UILabel!
    @IBOutlet weak var labelProtein: UILabel!
    @IBOutlet weak var labelEnergeticValue: UILabel!
    @IBOutlet weak var labelCarcohydates: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        CargarNutrientes()
    }
    private func CargarNutrientes(){
           
           let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/recipes/" + platosAgregar[myPlatoAgregar].id + "/nutri"
            request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                   .responseJSON(completionHandler: {
                       (data) in
                       switch(data.result){
                       case .success( _):
                           let json = try! JSON(data: data.data!)
                           self.labelCarcohydates.text = json["carbohydrates"].stringValue
                           self.labelEnergeticValue.text = json["energeticValue"].stringValue
                           self.labelSalt.text = json["salt"].stringValue
                           self.labelSugars.text = json["sugars"].stringValue
                           self.labelTotalFat.text = json["totalFat"].stringValue
                           self.labelProtein.text = json["protein"].stringValue
                           self.labelSaturatedFats.text = json["saturatedFats"].stringValue
                     
                       case .failure(let error):
                           print(error)
                       }
                   })
       }
       

    @IBAction func btnAgregar(_ sender: Any) {
    }
    

}
