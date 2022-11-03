//
//  PeopleParser.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 30/10/22.
//

import UIKit

struct PeopleParser: GenericResponseParser {
    
    typealias GenericReponseEntity = PeopleResponse
    typealias Json =  [[String: Any]]
       
    func parseData(data: Data?) -> PeopleResponse? {
        
        guard let jsonData = data else {
            
            return nil
        }
        
        var webServiceData: [Person] = [Person]()
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
        
        let peopleResponse = PeopleResponse(people:webServiceData)
        
        return peopleResponse
    }
    
}
