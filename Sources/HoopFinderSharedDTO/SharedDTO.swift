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
    public let open24Hours: Bool?
    public let operatingHours: String?
    public let users: [UUID]?
    public let courtImagePaths: [String]?
    public let createdByUserId: UUID?
    public let checkedInCount: Int?
    public let checkedInUsers: [UserProfileResponseDTO]?
    public let bestTimes: [BestTimeDTO]?

    public init(id: UUID, name: String, latitude: Double, longitude: Double, address: String? = nil, isOutside: Bool? = nil, hasLights: Bool? = nil, needMembership: Bool? = nil, open24Hours: Bool? = nil, operatingHours: String? = nil, users: [UUID]? = nil, courtImagePaths: [String]? = nil, createdByUserId: UUID? = nil, checkedInCount: Int? = nil, checkedInUsers: [UserProfileResponseDTO]? = nil, bestTimes: [BestTimeDTO]? = nil) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
        self.open24Hours = open24Hours
        self.operatingHours = operatingHours
        self.users = users
        self.courtImagePaths = courtImagePaths
        self.createdByUserId = createdByUserId
        self.checkedInCount = checkedInCount
        self.checkedInUsers = checkedInUsers
        self.bestTimes = bestTimes
    }
}

// MARK: - Check-in DTOs

public enum CheckinMode: String, Codable, CaseIterable, Sendable {
    case manual
    case geofence
    case auto
}

public struct CheckinRequestDTO: Codable, Sendable {
    public let mode: CheckinMode

    public init(mode: CheckinMode) {
        self.mode = mode
    }
}

public struct CheckinResponseDTO: Codable, Sendable {
    public let id: UUID
    public let userId: UUID
    public let locationId: UUID
    public let checkedInAt: Date
    public let expiresAt: Date
    public let mode: String

    public init(id: UUID, userId: UUID, locationId: UUID, checkedInAt: Date, expiresAt: Date, mode: String) {
        self.id = id
        self.userId = userId
        self.locationId = locationId
        self.checkedInAt = checkedInAt
        self.expiresAt = expiresAt
        self.mode = mode
    }
}

// MARK: - Best Time DTOs

public enum DayOfWeek: String, Codable, CaseIterable, Sendable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    case weekday, weekend, everyday

    public var displayName: String {
        switch self {
        case .monday: return "Mon"
        case .tuesday: return "Tue"
        case .wednesday: return "Wed"
        case .thursday: return "Thu"
        case .friday: return "Fri"
        case .saturday: return "Sat"
        case .sunday: return "Sun"
        case .weekday: return "Weekdays"
        case .weekend: return "Weekends"
        case .everyday: return "Every Day"
        }
    }
}

public struct BestTimeDTO: Codable, Sendable {
    public let id: UUID
    public let locationId: UUID
    public let addedByUserId: UUID
    public let addedByUsername: String
    public let days: [DayOfWeek]
    public let startTime: String
    public let endTime: String
    public let note: String?

    public init(id: UUID, locationId: UUID, addedByUserId: UUID, addedByUsername: String, days: [DayOfWeek], startTime: String, endTime: String, note: String? = nil) {
        self.id = id
        self.locationId = locationId
        self.addedByUserId = addedByUserId
        self.addedByUsername = addedByUsername
        self.days = days
        self.startTime = startTime
        self.endTime = endTime
        self.note = note
    }
}

public struct BestTimeRequestDTO: Codable, Sendable {
    public let days: [DayOfWeek]
    public let startTime: String
    public let endTime: String
    public let note: String?

    public init(days: [DayOfWeek], startTime: String, endTime: String, note: String? = nil) {
        self.days = days
        self.startTime = startTime
        self.endTime = endTime
        self.note = note
    }
}

public struct LocationUpdateDTO: Codable {
    public let name: String?
    public let address: String?
    public let isOutside: Bool?
    public let hasLights: Bool?
    public let needMembership: Bool?
    public let open24Hours: Bool?
    public let operatingHours: String?

    public init(name: String? = nil, address: String? = nil, isOutside: Bool? = nil, hasLights: Bool? = nil, needMembership: Bool? = nil, open24Hours: Bool? = nil, operatingHours: String? = nil) {
        self.name = name
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
        self.open24Hours = open24Hours
        self.operatingHours = operatingHours
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
    public let open24Hours: Bool?
    public let operatingHours: String?
    public let users: [UUID]?

    public init(name: String, latitude: Double, longitude: Double, address: String? = nil, isOutside: Bool? = nil, hasLights: Bool? = nil, needMembership: Bool? = nil, open24Hours: Bool? = nil, operatingHours: String? = nil, users: [UUID]? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isOutside = isOutside
        self.hasLights = hasLights
        self.needMembership = needMembership
        self.open24Hours = open24Hours
        self.operatingHours = operatingHours
        self.users = users
    }
}


// MARK: - Presence Sync

public struct UserLocationDTO: Codable, Sendable {
    public let latitude: Double
    public let longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct PresenceSyncResponseDTO: Codable, Sendable {
    public let checkedOutFrom: [UUID]
    public let checkedInTo: [UUID]

    public init(checkedOutFrom: [UUID], checkedInTo: [UUID]) {
        self.checkedOutFrom = checkedOutFrom
        self.checkedInTo = checkedInTo
    }
}

// MARK: - Follow DTOs

public struct FollowResponseDTO: Codable, Sendable {
    public let id: UUID
    public let followerId: UUID
    public let followingId: UUID
    public let createdAt: Date

    public init(id: UUID, followerId: UUID, followingId: UUID, createdAt: Date) {
        self.id = id
        self.followerId = followerId
        self.followingId = followingId
        self.createdAt = createdAt
    }
}

// MARK: - Team DTOs

public struct TeamResponseDTO: Codable, Sendable {
    public let id: UUID
    public let name: String
    public let creatorId: UUID
    public let createdAt: Date
    public let members: [TeamMemberResponseDTO]?

    public init(id: UUID, name: String, creatorId: UUID, createdAt: Date, members: [TeamMemberResponseDTO]? = nil) {
        self.id = id
        self.name = name
        self.creatorId = creatorId
        self.createdAt = createdAt
        self.members = members
    }
}

public struct TeamRequestDTO: Codable, Sendable {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}

public struct TeamMemberResponseDTO: Codable, Sendable {
    public let id: UUID
    public let teamId: UUID
    public let userId: UUID
    public let username: String
    public let role: String
    public let joinedAt: Date
    public let checkedInLocationName: String?

    public init(id: UUID, teamId: UUID, userId: UUID, username: String, role: String, joinedAt: Date, checkedInLocationName: String? = nil) {
        self.id = id
        self.teamId = teamId
        self.userId = userId
        self.username = username
        self.role = role
        self.joinedAt = joinedAt
        self.checkedInLocationName = checkedInLocationName
    }
}

public struct AddTeamMemberRequestDTO: Codable, Sendable {
    public let userId: UUID

    public init(userId: UUID) {
        self.userId = userId
    }
}

// MARK: - Chat DTOs

public struct ConversationResponseDTO: Codable, Sendable {
    public let id: UUID
    public let type: String
    public let teamId: UUID?
    public let teamName: String?
    public let otherUser: UserProfileResponseDTO?
    public let lastMessage: MessageResponseDTO?
    public let updatedAt: Date

    public init(id: UUID, type: String, teamId: UUID? = nil, teamName: String? = nil, otherUser: UserProfileResponseDTO? = nil, lastMessage: MessageResponseDTO? = nil, updatedAt: Date) {
        self.id = id
        self.type = type
        self.teamId = teamId
        self.teamName = teamName
        self.otherUser = otherUser
        self.lastMessage = lastMessage
        self.updatedAt = updatedAt
    }
}

public struct MessageResponseDTO: Codable, Sendable {
    public let id: UUID
    public let conversationId: UUID
    public let senderId: UUID
    public let senderUsername: String
    public let body: String
    public let createdAt: Date

    public init(id: UUID, conversationId: UUID, senderId: UUID, senderUsername: String, body: String, createdAt: Date) {
        self.id = id
        self.conversationId = conversationId
        self.senderId = senderId
        self.senderUsername = senderUsername
        self.body = body
        self.createdAt = createdAt
    }
}

public struct SendMessageRequestDTO: Codable, Sendable {
    public let body: String

    public init(body: String) {
        self.body = body
    }
}

public struct WSIncomingMessage: Codable, Sendable {
    public let type: String
    public let token: String?
    public let conversationId: UUID?
    public let body: String?

    public init(type: String, token: String? = nil, conversationId: UUID? = nil, body: String? = nil) {
        self.type = type
        self.token = token
        self.conversationId = conversationId
        self.body = body
    }
}

public struct WSOutgoingMessage: Codable, Sendable {
    public let type: String
    public let message: MessageResponseDTO?
    public let error: String?

    public init(type: String, message: MessageResponseDTO? = nil, error: String? = nil) {
        self.type = type
        self.message = message
        self.error = error
    }
}
