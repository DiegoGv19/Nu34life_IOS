//
//  ToDoItemView.swift
//  Programando
//
//  Created by Developer on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                Text(createdAt)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
