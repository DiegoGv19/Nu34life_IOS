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
    @IBOutlet weak var labelHorarioA: UILabel!
    
    @IBOutlet weak var labelTotalFat: UILabel!
    @IBOutlet weak var labelSugars: UILabel!
    @IBOutlet weak var labelSalt: UILabel!
    @IBOutlet weak var labelSaturatedFats: UILabel!
    @IBOutlet weak var labelProtein: UILabel!
    @IBOutlet weak var labelEnergeticValue: UILabel!
    @IBOutlet weak var labelCarcohydates: UILabel!
    @IBOutlet weak var labelNombrePlatoA: UILabel!
    @IBOutlet weak var labelDiaA: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelDiaA.text = Dias[myDia]
        labelHorarioA.text = Horas[myHoras]
        labelNombrePlatoA.text = platosAgregar[myPlatoAgregar].nombre
        CargarNutrientes()
    }
    
    @IBAction func btnAgregarPlatoDieta(_ sender: Any) {
        let delegado = UIApplication.shared.delegate as! AppDelegate
           let url = delegado.urlServicio + "/plans"
        
        let parametros:Parameters = ["day":labelDiaA.text!,"patientId":pacientes[myIndex].id,"recipeId": platosAgregar[myPlatoAgregar].id,"turn":labelHorarioA.text!]
           request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil)
               .responseJSON(completionHandler: {
                   (resulatado) in
                   switch(resulatado.result){
                   case .success( _):
                       self.mostrarCuadroDialogo(titulo: "AVISO", mensaje: "Plato registrado exitosamente.")
                   case .failure( _):
                       self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "Errror al registrar plato, vuelva a intentar.")
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
      

}
