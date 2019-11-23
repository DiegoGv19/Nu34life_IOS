//
//  LoginPaciente.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var pacienteLogin: Paciente = Paciente(name: "", lastName: "", id: "", email: "", password: "",birthdate: "",phone: "")
var ValidarPaciente: Bool = false
class LoginPaciente: UIViewController {
    @IBOutlet weak var labelPacienteCorreo: UITextField!
    @IBOutlet weak var labelPacienteContraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ValidarPaciente = false


    }
    

    @IBAction func btnIniciarSesionPaciente(_ sender: Any) {
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
               let url = delegado.urlServicio + "/patients?email="+labelPacienteCorreo.text!+"&password="+labelPacienteContraseña.text!
           
               request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                   .responseJSON(completionHandler: {
                       (data) in
                       switch(data.result){
                       case .success( _):
                            ValidarPaciente = true
                           let json = try! JSON(data: data.data!)
                           
                           pacienteLogin.id = json["id"].stringValue
                           pacienteLogin.name = json["name"].stringValue
                          
                           pacienteLogin.lastName = json["lastName"].stringValue
                           pacienteLogin.email = json["email"].stringValue
                           
                           pacienteLogin.password = json["password"].stringValue
                           pacienteLogin.birthdate = json["birthdate"].stringValue
                           self.navigationToMainInterface()
                        
                           
                       case .failure( _):
                            ValidarPaciente = false
                           self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "El usuario no esta registrado.")
                       }
                   })
    }
    
    func mostrarCuadroDialogo(titulo:String,mensaje:String){
              let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
              let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
              ventana.addAction(botonOK)
              self.present(ventana, animated:true, completion:nil)
          }
    private func navigationToMainInterface(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainPaciente = mainStoryboard.instantiateViewController(withIdentifier: "PacienteSalud") as? PacienteSalud else{
            return
        }
        navigationController?.pushViewController(mainPaciente, animated: true)
    }
    
}
