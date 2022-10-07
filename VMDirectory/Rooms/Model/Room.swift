//
//  Room.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//


import Foundation

struct Room: Codable {
    
    var createdAt    : String? = nil
    var isOccupied   : Bool?   = nil
    var maxOccupancy : Int?    = nil
    var id           : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case createdAt    = "createdAt"
        case isOccupied   = "isOccupied"
        case maxOccupancy = "maxOccupancy"
        case id           = "id"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        createdAt    = try values.decodeIfPresent(String.self , forKey: .createdAt    )
        isOccupied   = try values.decodeIfPresent(Bool.self   , forKey: .isOccupied   )
        maxOccupancy = try values.decodeIfPresent(Int.self    , forKey: .maxOccupancy )
        id           = try values.decodeIfPresent(String.self , forKey: .id           )
        
    }
    
    init() {
        
    }
    
    init(createdAt: String?, isOccupied:Bool?, maxOccupancy: Int?, id           : String?) {
        self.createdAt = createdAt
        self.isOccupied = isOccupied
        self.maxOccupancy = maxOccupancy
        self.id = id
    }
    
}
