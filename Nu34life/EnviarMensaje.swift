//
//  EnviarMensaje.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/22/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import MessageUI
class EnviarMensaje: UIViewController, MFMessageComposeViewControllerDelegate {
    @IBOutlet weak var labelNombreMensaje: UILabel!
    
    @IBOutlet weak var txtMensajeEnviar: UITextView!
    @IBOutlet weak var labelNumeroMensaje: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNombreMensaje.text = pacientes[myIndex].name + "  " + pacientes[myIndex].lastName
        labelNumeroMensaje.text = pacientes[myIndex].phone
    }
    

    @IBAction func btnEnviarMensaje(_ sender: Any) {
        /*
         Enviar Mensaje
         if(MFMessageComposeViewController.canSendText()){
            let controller = MFMessageComposeViewController()
            controller.body = self.txtMensajeEnviar.text
            controller.recipients = [self.labelNumeroMensaje.text!]
            controller.messageComposeDelegate = self
            self.presentedViewController(controller, animated: true, completion: nil)
        }*/
        	
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }

}
