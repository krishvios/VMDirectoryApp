//
//  ApiClient.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 07/10/22.
//

import Foundation

public struct ApiClient {
    
    static func getPeopleDataFromServer( complete: @escaping (_ success: Bool, _ data: [Person]? )->() ){
        DispatchQueue.global().async {
            sleep(2)
            var webServiceData: [Person] = [Person]()
            let urlString = Constants.baseURLStr + "/people"

                if let url = URL(string: urlString) {
                    if let jsonData = try? Data(contentsOf: url) {
                        
                        let decoder = JSONDecoder()
                        let personData = try! decoder.decode([Person].self, from: jsonData)
                        for i in 0..<personData.count {
                            let person = personData[i]
                            webServiceData.append(Person(createdAt: person.createdAt,
                                                         firstName: person.firstName,
                                                         avatar: person.avatar,
                                                         lastName: person.lastName,
                                                         email: person.email,
                                                         jobtitle: person.jobtitle,
                                                         favouriteColor: person.favouriteColor,
                                                         id: person.id))
                        }
                    }
                }
            
            
            complete(true, webServiceData)
            // If server gives an error, use "complete(false, nil)"
        }
    }
    
    static func getRoomsDataFromServer( complete: @escaping (_ success: Bool, _ data: [Room]? )->() ){
            DispatchQueue.global().async {
                sleep(2)
                var webServiceData: [Room] = [Room]()
                let urlString = Constants.baseURLStr + "/rooms"

                    if let url = URL(string: urlString) {
                        if let jsonData = try? Data(contentsOf: url) {
                            
                            let decoder = JSONDecoder()
                            let roomData = try! decoder.decode([Room].self, from: jsonData)
                            for i in 0..<roomData.count {
                                let room = roomData[i]
                                webServiceData.append(Room(createdAt: room.createdAt, isOccupied: room.isOccupied, maxOccupancy: room.maxOccupancy, id: room.id))
                            }
                        }
                    }
                
                
                complete(true, webServiceData)
                // If server gives an error, use "complete(false, nil)"
            }
        }
}
