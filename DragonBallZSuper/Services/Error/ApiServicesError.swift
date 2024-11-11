//
//  ApiError.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 11/11/24.
//

import Foundation

enum ApiServicesError: LocalizedError {
    case serverError
    case characterNotFound
    var errorDescription: String? {
           switch self {
           case .serverError:
               return "El servidor no response, intentelo mas tarde"
           case .characterNotFound:
               return "El personaje que buscas no se ha encontrado. Por favor, busque de nuevo"
           }
       }
}
