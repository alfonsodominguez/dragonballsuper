//
//  HomeViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import Foundation

class ContentViewModel {
    
    func getAllCharacter() async -> Resource<ItemsCharacter> {
        let apiService = ApiServices()
        
        guard let result = try? await apiService.getAllCharacters() else {
            return Resource.error(data: nil, error: ApiServicesError.serverError)
        }
        return Resource.success(data: result)
    }
}
