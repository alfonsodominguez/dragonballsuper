//
//  HomeViewModel.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 2/11/24.
//

import Foundation

class HomeViewModel {
    let apiService = ApiServices()
    
    func getCharacter(id: Int) async -> Resource<Character> {
        
        guard let result = try? await apiService.getCharacter(id: id) else {
            return Resource.error(data: nil, error: ApiServicesError.serverError)
        }
        
        return Resource.success(data: result)
    }
    
    func getCharacterByName(name: String) async -> Resource<[Character]> {
        guard let result = try? await apiService.getCharacterByName(name: name) else {
            return Resource.error(data: nil, error: ApiServicesError.serverError)
        }
        if result.isEmpty {
            return Resource.error(data: nil, error: ApiServicesError.characterNotFound)
        }
        return Resource.success(data: result)
    }
    
    func divideIntoGroups<T>(_ array: [T], groupSize: Int) -> [[T]] {
        var result: [[T]] = []
        
        for i in stride(from: 0, to: array.count, by: groupSize) {
            let end = min(i + groupSize, array.count)
            let group = Array(array[i..<end])
            result.append(group)
        }
        return result
    }
}
