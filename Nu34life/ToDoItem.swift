//
//  ToDoItem.swift
//  Programando
//
//  Created by Developer on 10/31/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem{
    static func getAllToDoItem() -> NSFetchRequest<ToDoItem>{
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptior = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptior]
        
        return request
    }
}
