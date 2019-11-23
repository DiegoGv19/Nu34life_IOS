//
//  CrearNutricionista.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/17/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire

class CrearNutricionista: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtFechaNacimiento: UITextField!
    @IBOutlet weak var txtCorreoElectronico: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var txtNumeroCelular: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func txtNombreExit(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    
    @IBAction func txtApellidoExit(_ sender: Any) {
        self.resignFirstResponder()

    }
    
    @IBAction func txtFechaNacimiento(_ sender: Any) {
        self.resignFirstResponder()

    }
    
    @IBAction func txtCorreoElectronico(_ sender: Any) {
        self.resignFirstResponder()

    }
    @IBAction func txtContraseña(_ sender: Any) {
        self.resignFirstResponder()

    }
    
    @IBAction func txtNumeroCelular(_ sender: Any) {
        self.resignFirstResponder()

    }
    
    @IBAction func btnCrear(_ sender: Any) {
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/nutritionists"
        let parametros:Parameters = ["birthdate":txtFechaNacimiento.text!,"email":txtCorreoElectronico.text!,"lastName":txtApellido.text!,"name":txtNombre.text!,"password":txtContraseña.text!,"phone":txtNumeroCelular.text!]
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
