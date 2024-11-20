//
//  PlanetViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 20/11/24.
//

import Foundation

class PlanetViewModel {
    let apiService = ApiServices()
    
    func getAllPlanet() async -> Resource<ItemsPlanet> {
    
        guard let result = try? await apiService.getAllPlanets() else {
            return Resource.error(data: nil, error: ApiServicesError.serverError)
        }
        
        return Resource.success(data: result)
    }
}
