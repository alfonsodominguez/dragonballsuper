//
//  CharacterServices.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 29/10/24.
//

import Foundation

class ApiServices {
    let characterUrl: String = "https://dragonball-api.com/api/characters"
    let planetUrl: String = "https://dragonball-api.com/api/planets"
    let transformationUrl = "https://dragonball-api.com/api/transformations"
    
    func getCharacter(id: Int) async throws -> Character? {
        let urlString = characterUrl + String(id)
        let url = URL(string:urlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            fatalError("Bad response")
        }
        
        return try JSONDecoder().decode(Character.self, from: data)
    }
    
    func getAllCharacters(limit: Int = 100) async throws -> ItemsCharacter? {
        let urlString = characterUrl + "?limit=\(limit)"
        let url = URL(string:urlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        
        return try JSONDecoder().decode(ItemsCharacter.self, from: data)
    }
    
    func getCharacterByName(name: String) async throws -> [Character]?{
        let urlString = characterUrl + "?name=\(name)"
        let url = URL(string:urlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        return try JSONDecoder().decode([Character].self, from: data)
        
    }
    
    func getAllPlanets(limit: Int = 100) async throws -> ItemsPlanet? {
        let urlString = planetUrl + "?limit=\(limit)"
        let url = URL(string:urlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
    
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        return try JSONDecoder().decode(ItemsPlanet.self, from: data)
    }
    
    func getTransformations() async throws -> [TransformationCharacter]? {
        let url = URL(string:transformationUrl)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        
        return try JSONDecoder().decode([TransformationCharacter].self, from: data)
    }
    
    
}
