//
//  Location.swift
//  ToDo
//
//  Created by Ujjwal Chafle on 09/02/2024.
//

import Foundation

struct Location: Equatable, Codable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        
        if lhs.coordinates == nil, rhs.coordinates != nil {
            return false
        }
        
        if lhs.coordinates != nil, rhs.coordinates == nil {
            return false
        }
        
        if let lhsCoordinate = lhs.coordinates,
           let rhsCoordinate = rhs.coordinates {
            if abs(lhsCoordinate.longitude - rhsCoordinate.longitude) > 0.000_000_1 {
                return false
            }
            if abs(lhsCoordinate.latitude - rhsCoordinate.latitude) > 0.000_000_1 {
                return false
            }
        }
        return true
    }
    
    let name: String
    let coordinates: Coordinates?
    
    init(
        name: String,
        coordinates: Coordinates? = nil
    ) {
        self.name = name
        self.coordinates = coordinates
    }
}
