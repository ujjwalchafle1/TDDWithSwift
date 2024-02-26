//
//  FileManageExtension.swift
//  ToDo
//
//  Created by Ujjwal Chafle on 26/02/2024.
//

import Foundation

extension FileManager {
    func documentURL(name: String) -> URL {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        return url.appendingPathComponent(name)
    }
}
