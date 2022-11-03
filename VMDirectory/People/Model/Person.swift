//
//  Person.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import Foundation

struct Person: Codable {
    
    var createdAt      : String? = nil
    var firstName      : String? = nil
    var avatar         : String? = nil
    var lastName       : String? = nil
    var email          : String? = nil
    var jobtitle       : String? = nil
    var favouriteColor : String? = nil
    var id             : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case createdAt      = "createdAt"
        case firstName      = "firstName"
        case avatar         = "avatar"
        case lastName       = "lastName"
        case email          = "email"
        case jobtitle       = "jobtitle"
        case favouriteColor = "favouriteColor"
        case id             = "id"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        createdAt      = try values.decodeIfPresent(String.self , forKey: .createdAt      )
        firstName      = try values.decodeIfPresent(String.self , forKey: .firstName      )
        avatar         = try values.decodeIfPresent(String.self , forKey: .avatar         )
        lastName       = try values.decodeIfPresent(String.self , forKey: .lastName       )
        email          = try values.decodeIfPresent(String.self , forKey: .email          )
        jobtitle       = try values.decodeIfPresent(String.self , forKey: .jobtitle       )
        favouriteColor = try values.decodeIfPresent(String.self , forKey: .favouriteColor )
        id             = try values.decodeIfPresent(String.self , forKey: .id             )
        
    }
    
    init() {
        
    }
    
    init(createdAt: String?,firstName: String?, avatar: String?, lastName: String?, email: String?, jobtitle: String?, favouriteColor: String?, id: String?) {
        self.createdAt = createdAt
        self.firstName = firstName
        self.avatar = avatar
        self.lastName = lastName
        self.email = email
        self.jobtitle = jobtitle
        self.favouriteColor = favouriteColor
        self.id = id
    }
    
}
