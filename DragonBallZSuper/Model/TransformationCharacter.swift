//
//  TransformationCharacter.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 23/11/24.
//

import Foundation

struct TransformationCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let ki: String
    let deletedAt: String?
}
