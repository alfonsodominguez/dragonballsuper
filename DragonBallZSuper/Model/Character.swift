//
//  Character.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import Foundation

struct Character: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    let image: String
    let affiliation: String
    let deletedAt: String?

    static let sampleData: [Character] = [
           Character(
               id: 1,
               name: "Goku",
               ki: "60.000.000",
               maxKi: "90 Septillion",
               race: "Saiyan",
               gender: "Male",
               description: "El protagonista de la serie...",
               image: "https://dragonball-api.com/characters/goku_normal.webp",
               affiliation: "Z Fighter",
               deletedAt: nil
           ),
           Character(
               id: 2,
               name: "Vegeta",
               ki: "55.000.000",
               maxKi: "85 Septillion",
               race: "Saiyan",
               gender: "Male",
               description: "El príncipe de los Saiyans...",
               image: "https://dragonball-api.com/characters/vegeta_normal.webp",
               affiliation: "Z Fighter",
               deletedAt: nil
           )
       ]
}
