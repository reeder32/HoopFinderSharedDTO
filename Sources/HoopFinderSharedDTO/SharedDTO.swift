//
//  File.swift
//  HoopFinderSharedDTO
//
//  Created by Nicholas Reeder on 2/10/25.
//

import Foundation

// MARK: - Basketball Profile Enums

public enum ExperienceLevel: String, Codable, CaseIterable, Sendable {
    case never
    case recreational
    case highSchool
    case communityCollege
    case d3
    case d2
    case d1
    case proSemiPro

    public var displayName: String {
        switch self {
        case .never: return "Never Played"
        case .recreational: return "Recreational"
        case .highSchool: return "High School"
        case .communityCollege: return "Community College"
        case .d3: return "Division 3"
        case .d2: return "Division 2"
        case .d1: return "Division 1"
        case .proSemiPro: return "Pro / Semi-Pro"
        }
    }
}

public enum PlayFrequency: String, Codable, CaseIterable, Sendable {
    case rarely
    case onceOrTwiceMonth
    case onceOrTwiceWeek
    case threeToFourWeek
    case daily

    public var displayName: String {
        switch self {
        case .rarely: return "Rarely"
        case .onceOrTwiceMonth: return "1-2x / month"
        case .onceOrTwiceWeek: return "1-2x / week"
        case .threeToFourWeek: return "3-4x / week"
        case .daily: return "Daily"
        }
    }
}

public enum CourtPreference: String, Codable, CaseIterable, Sendable {
    case indoor
    case outdoor
    case noPreference

    public var displayName: String {
        switch self {
        case .indoor: return "Indoor"
        case .outdoor: return "Outdoor"
        case .noPreference: return "No Preference"
        }
    }
}

// MARK: - User Profile DTOs

public struct UserProfileResponseDTO: Codable, Sendable {
    public let id: UUID
    public let username: String
    public let name: String?
    public let email: String?
    public let height: Double?
    public let weight: Double?
    public let age: Int?
    public let experienceLevel: ExperienceLevel?
    public let yearsPlaying: Int?
    public let playFrequency: PlayFrequency?
    public let courtPreference: CourtPreference?
    public let overallRating: Int?
    public let selfRating: Int?
    public let profileImagePath: String?

    public init(id: UUID, username: String, name: String? = nil, email: String? = nil, height: Double? = nil, weight: Double? = nil, age: Int? = nil, experienceLevel: ExperienceLevel? = nil, yearsPlaying: Int? = nil, playFrequency: PlayFrequency? = nil, courtPreference: CourtPreference? = nil, overallRating: Int? = nil, selfRating: Int? = nil, profileImagePath: String? = nil) {
        self.id = id
        self.username = username
        self.name = name
        self.email = email
        self.height = height
        self.weight = weight
        self.age = age
        self.experienceLevel = experienceLevel
        self.yearsPlaying = yearsPlaying
        self.playFrequency = playFrequency
        self.courtPreference = courtPreference
        self.overallRating = overallRating
        self.selfRating = selfRating
        self.profileImagePath = profileImagePath
    }
}

public struct UserProfileUpdateDTO: Codable, Sendable {
    public let name: String?
    public let email: String?
    public let height: Double?
    public let weight: Double?
    public let age: Int?
    public let experienceLevel: ExperienceLevel?
    public let yearsPlaying: Int?
    public let playFrequency: PlayFrequency?
    public let courtPreference: CourtPreference?
    public let selfRating: Int?

    public init(name: String? = nil, email: String? = nil, height: Double? = nil, weight: Double? = nil, age: Int? = nil, experienceLevel: ExperienceLevel? = nil, yearsPlaying: Int? = nil, playFrequency: PlayFrequency? = nil, courtPreference: CourtPreference? = nil, selfRating: Int? = nil) {
        self.name = name
        self.email = email
        self.height = height
        self.weight = weight
        self.age = age
        self.experienceLevel = experienceLevel
        self.yearsPlaying = yearsPlaying
        self.playFrequency = playFrequency
        self.courtPreference = courtPreference
        self.selfRating = selfRating
    }
}

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
    public let users: [UUID]?
    
    public init(id: UUID, name: String, latitude: Double, longitude: Double, address: String, isOutside: Bool, hasLights: Bool, needMembership: Bool, users: [UUID]) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
        self.users = users
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
    public let users: [UUID]?
  

    
    public init(name: String, latitude: Double, longitude: Double, address: String, isOutside: Bool, hasLights: Bool, needMembership: Bool, users: [UUID]) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
        self.users = users
    }
}

