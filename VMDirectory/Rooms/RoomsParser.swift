//
//  RoomsParser.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 31/10/22.
//

import UIKit

struct RoomsParser: GenericResponseParser {
    
    typealias GenericReponseEntity = RoomsResponse
    typealias Json =  [[String: Any]]
    
    func parseData(data: Data?) -> RoomsResponse? {
        
        guard let jsonData = data else {
            
            return nil
        }
        
        var webServiceData: [Room] = [Room]()
        let decoder = JSONDecoder()
        let roomsData = try! decoder.decode([Room].self, from: jsonData)
        for i in 0..<roomsData.count {
            let room = roomsData[i]
            webServiceData.append(Room(createdAt: room.createdAt,
                                       isOccupied: room.isOccupied,
                                       maxOccupancy: room.maxOccupancy,
                                       id: room.id))
        }
        
        let roomsResponse = RoomsResponse(rooms:webServiceData)
        
        return roomsResponse
    }
    
}
