//
//  NotasController.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/18/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItem()) var toDoItem:FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("New...")){
                    HStack{
                        TextField("New Item", text: self.$newToDoItem)
                        Button(action:{
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill").foregroundColor(.green).imageScale(.large)
                        }
                    }
                }
                Section(header: Text("To Do's")){
                    ForEach(self.toDoItem){
                        toDoItem in ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }
                    .onDelete{IndexSet in
                        let deleteItem = self.toDoItem[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("** PROGRAMANDO **"))
        .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }
