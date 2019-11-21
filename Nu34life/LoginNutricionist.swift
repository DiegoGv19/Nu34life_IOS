//
//  LoginNutricionist.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/17/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var IdNutricionista = ""
class LoginNutricionist: UIViewController {
    
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        IdNutricionista = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnIniciarSesion(_ sender: Any) {
       	
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/nutritionists?email="+txtCorreo.text!+"&password="+txtContraseña.text!
    
        request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler: {
                (data) in
                switch(data.result){
                case .success( _):
                    let json = try! JSON(data: data.data!)
                    
                    IdNutricionista = json["id"].stringValue
                    self.navigationToMainInterface()
                    print(IdNutricionista)
                    
                case .failure( _):
                    self.mostrarCuadroDialogo(titulo: "ERRO", mensaje: "El usuario no esta registrado.")
                }
            })
    }
    
    /*@IBAction func txtCorreo(_ sender: Any) {
        self.resignFirstResponder()

    }
    @IBAction func txtContraseña(_ sender: Any) {
        self.resignFirstResponder()

    }*/
    func mostrarCuadroDialogo(titulo:String,mensaje:String){
           let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
           let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
           ventana.addAction(botonOK)
           self.present(ventana, animated:true, completion:nil)
       }
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var mainNutricionista = segue.destination as! MainNutricionista
        mainNutricionista.id = self.idEnviar
    }
  */
    private func navigationToMainInterface(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainNutricionista = mainStoryboard.instantiateViewController(withIdentifier: "MainNutricionista") as? MainNutricionista else{
            return
        }
        navigationController?.pushViewController(mainNutricionista, animated: true)
    }
    

}
