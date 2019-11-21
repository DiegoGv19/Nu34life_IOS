//
//  MainNutricionistapacienteEditar.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/20/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire

class MainNutricionistapacienteEditar: UIViewController {

    @IBOutlet weak var txtPeso: UITextField!
    
    @IBOutlet weak var txtTalla: UITextField!
    
    @IBOutlet weak var txtGlucosa: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPeso.text = state.weight
        txtTalla.text = state.height
        txtGlucosa.text = state.glucose
    }
    
    @IBAction func txtPeso(_ sender: Any) {        self.resignFirstResponder()

    }
    @IBAction func txtTalla(_ sender: Any) {        self.resignFirstResponder()

    }
    
    @IBAction func txtGlucosa(_ sender: Any) {        self.resignFirstResponder()

    }
    
    @IBAction func btnActualizar(_ sender: Any) {
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/states/patient?email="+pacientes[myIndex].email+"&password="+pacientes[myIndex].password
        let parametros:Parameters = ["description": "",
           "generatedDate": "2019-11-20T22:55:33.934Z",
           "glucose": txtGlucosa.text!,
           "height": txtTalla.text!,
           "id": pacientes[myIndex].id,
           "weight": txtPeso.text!]
           request(url, method: .put, parameters: parametros, encoding: JSONEncoding.default, headers: nil)
               .responseJSON(completionHandler: {
                   (resulatado) in
                   switch(resulatado.result){
                   case .success( _):
                       self.mostrarCuadroDialogo(titulo: "AVISO", mensaje: "Se actualizo el estado del usuario.")
                   case .failure( _):
                       self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "Errror al actualizar el usuario, vuelva a intentar.")
                   }
               })
      
    }
    
    func mostrarCuadroDialogo(titulo:String,mensaje:String){
         let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
         let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
         ventana.addAction(botonOK)
         self.present(ventana, animated:true, completion:nil)
     }
    
}
