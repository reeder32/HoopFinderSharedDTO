//
//  File.swift
//  HoopFinderSharedDTO
//
//  Created by Nicholas Reeder on 2/10/25.
//

import Foundation

public struct LoginResponseDTO: Codable {
    public let error: Bool
    public var reason: String? = nil
    public var token: String? = nil
    public var userId: UUID? = nil
    
    public init(error: Bool, reason: String? = nil, token: String? = nil, userId: UUID? = nil) {
        self.error = error
        self.reason = reason
        self.token = token
        self.userId = userId
    }
}

public struct RegisterResponseDTO: Codable {
    public let error: Bool
    public var reason: String? = nil
    
    public init(error: Bool, reason: String? = nil) {
        self.error = error
        self.reason = reason
    }
}

public struct LocationResponseDTO: Codable {
    public let id: UUID
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let address: String?
    public let isOutside: Bool?
    public let hasLights: Bool?
    public let needMembership: Bool?
    
    public init(id: UUID, name: String, latitude: Double, longitude: Double, address: String, isOutside: Bool, hasLights: Bool, needMembership: Bool) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
    }
    
}
public struct LocationRequestDTO: Codable {
    
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let address: String?
    public let isOutside: Bool?
    public let hasLights: Bool?
    public let needMembership: Bool?
    
    public init(name: String, latitude: Double, longitude: Double, address: String, isOutside: Bool, hasLights: Bool, needMembership: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
    }
}

