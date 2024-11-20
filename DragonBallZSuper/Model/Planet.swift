//
//  Planet.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import Foundation

struct Planet: Codable, Identifiable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
    let deletedAt: String?
    
}
