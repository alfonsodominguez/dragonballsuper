//
//  HomeViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 2/11/24.
//

import Foundation

class HomeViewModel {
    
    func getCharacter(id: Int) async -> Character {
        let apiService = ApiServices()
        
        return try! await apiService.getCharacter(id: id)
    }
}
