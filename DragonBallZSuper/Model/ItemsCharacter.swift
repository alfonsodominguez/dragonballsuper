//
//  ItemsCharacter.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import Foundation

class ItemsCharacter: Codable {
    var items: [Character]
    
    init(items: [Character]) {
        self.items = items
    }
    
    static let sample = ItemsCharacter(items: Character.sampleData)
}
