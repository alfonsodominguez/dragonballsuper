//
//  Resource.swift
//  DragonBallZSuper
//
//  Created by Alfonso Dominguez on 11/11/24.
//

import Foundation

struct Resource <T> {
    private var data: T?
    private var error: ApiServicesError?
    private var status: ResourceStatus = .none
    
    public func getError() -> ApiServicesError? {
        return self.error
    }
    
    public func getMessageError() -> String? {
        return self.error?.localizedDescription
    }
    
    public func getData() -> T? {
        return self.data
    }
    
    public static func success(data: T) -> Resource<T> {
        return self.init(data: data, error: nil, status: .success)
    }
    
    public static func error(data: T?, error: ApiServicesError) -> Resource<T> {
        return self.init(data: data, error: error, status: .error)
    }
}
