//
//  CrearPaciente.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
class CrearPaciente: UIViewController {

    @IBOutlet weak var labelIdNutriPacienteC: UITextField!
    @IBOutlet weak var labelNumeroPacienteC: UITextField!
    @IBOutlet weak var labelApellidoPacienteC: UITextField!
    @IBOutlet weak var labelNombrePacienteC: UITextField!
    @IBOutlet weak var labelCorreoPacienteC: UITextField!
    @IBOutlet weak var labelContraseñaPacienteC: UITextField!
    @IBOutlet weak var labelFechaPacienteC: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func labelNombrePF(_ sender: Any) {self.resignFirstResponder()
    }
    
    @IBAction func labelIdNutri(_ sender: Any) {self.resignFirstResponder()
    }
    
    @IBAction func labelPacientePE(_ sender: Any) {self.resignFirstResponder()
    }
    @IBAction func labelFechaPE(_ sender: Any) {self.resignFirstResponder()
    }
    @IBAction func labelCorreoPE(_ sender: Any) {self.resignFirstResponder()
    }
    
    @IBAction func labelContraseñaPE(_ sender: Any) {self.resignFirstResponder()
    }
    
    @IBAction func labelNumeroPE(_ sender: Any) {self.resignFirstResponder()
    }
    //        self.resignFirstResponder()

    @IBAction func btnCrearNuevoPaciente(_ sender: Any) {
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/nutritionists/" + labelIdNutriPacienteC.text!
        let parametros:Parameters = ["birthdate":labelFechaPacienteC.text!,"email":labelCorreoPacienteC.text!,"lastName":labelApellidoPacienteC.text!,"name":labelNombrePacienteC.text!,"password":labelContraseñaPacienteC.text!,"phone":labelNombrePacienteC.text!]
        request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler: {
                (resulatado) in
                switch(resulatado.result){
                case .success( _):
                    self.mostrarCuadroDialogo(titulo: "AVISO", mensaje: "Usuario registrado exitosamente.")
                case .failure( _):
                    self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "Errror al registrar usuario, vuelva a intentar.")
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
