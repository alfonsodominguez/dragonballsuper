//
//  HomeViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import Foundation

class ContentViewModel {
    
    func getAllCharacter() async -> ItemsCharacter {
        let apiService = ApiServices()
        
        return try! await apiService.getAllCharacters()
    }
}
