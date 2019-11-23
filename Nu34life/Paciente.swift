//
//  Paciente.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/18/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//
import Foundation
import UIKit
class Paciente{
    
    var name: String
    var lastName: String
    var id: String
    var email:String
    var password:String
    var birthdate:String
    var phone: String
    init(name:String,lastName:String,id:String,email:String, password:String,birthdate:String,phone: String) {
        self.name=name
        self.lastName=lastName
        self.id=id
        self.email=email
        self.password=password
        self.birthdate=birthdate
        self.phone = phone
    }
}




