//
//  TransformationViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 23/11/24.
//

import Foundation

class TransformationViewModel {
    let apiService = ApiServices()
    
    func getTransformations() async -> Resource<[TransformationCharacter]> {
    
        guard let result = try? await apiService.getTransformations() else {
            return Resource.error(data: nil, error: ApiServicesError.serverError)
        }
        
        return Resource.success(data: result)
    }
}
