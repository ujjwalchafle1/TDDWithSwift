//
//  File.swift
//  ToDo
//
//  Created by Ujjwal Chafle on 07/02/2024.
//

import Foundation

struct ToDoItem: Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    
    init(
        title: String,
        itemDescription: String? = nil,
        timestamp: TimeInterval? = nil,
        location: Location? = nil
    ) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}
