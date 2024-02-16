//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Ujjwal Chafle on 16/02/2024.
//

import Foundation
import Combine

class ToDoItemStore {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
    }
}
