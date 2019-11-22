//
//  DietaEliminarPlato.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/21/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class DietaEliminarPlato: UIViewController {

    @IBOutlet weak var labelTotalFatE: UILabel!
    @IBOutlet weak var labelCarcohydatesE: UILabel!
    @IBOutlet weak var labelSugarsE: UILabel!
    @IBOutlet weak var labelSaturatedFatsE: UILabel!
    @IBOutlet weak var labelSaltE: UILabel!
    @IBOutlet weak var labelProteinE: UILabel!
    @IBOutlet weak var labelEnergeticValueE: UILabel!
    @IBOutlet weak var labelNombrePlatoE: UILabel!
    @IBOutlet weak var labelHorarioE: UILabel!
    
    @IBOutlet weak var labelDiaE: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDiaE.text = Dias[myDia]
        labelHorarioE.text = Horas[myHoras]
        labelNombrePlatoE.text = platosComer[myPlato].nombre
        CargarNutrientes()
    }
    

    @IBAction func btnEliminarPlato(_ sender: Any) {let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/plans/" + platosComer[myPlato].idPlan
        
           request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil)
               .responseJSON(completionHandler: {
                   (resulatado) in
                   switch(resulatado.result){
                   case .success( _):
                       self.mostrarCuadroDialogo(titulo: "AVISO", mensaje: "Plato Eliminado exitosamente.")
                       
                   case .failure( _):
                       self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "Errror al eliminar el plato, vuelva a intentar.")
                   }
               })
        
        
    }
    
    func mostrarCuadroDialogo(titulo:String,mensaje:String){
                let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
                let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                ventana.addAction(botonOK)
                self.present(ventana, animated:true, completion:nil)
            }
    
    private func CargarNutrientes(){
            
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/recipes/" + platosComer[myPlato].id + "/nutri"
             request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                    .responseJSON(completionHandler: {
                        (data) in
                        switch(data.result){
                        case .success( _):
                            let json = try! JSON(data: data.data!)
                            
                            self.labelCarcohydatesE.text = json["carbohydrates"].stringValue
                            self.labelEnergeticValueE.text = json["energeticValue"].stringValue
                            self.labelSaltE.text = json["salt"].stringValue
                            self.labelSugarsE.text = json["sugars"].stringValue
                            self.labelTotalFatE.text = json["totalFat"].stringValue
                            self.labelProteinE.text = json["protein"].stringValue
                            self.labelSaturatedFatsE.text = json["saturatedFats"].stringValue
                      
                        case .failure(let error):
                            print(error)
                        }
                    })
        }
}
