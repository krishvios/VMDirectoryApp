//
//  PeopleConfig.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 30/10/22.
//

import UIKit

struct PeopleConfig: GenericCallConfig {

    let requestMethod: RequestMethod = .get
    let path = "v1/people"
    var queryItems: [URLQueryItem]?
    
    func params() -> RequestParams? {
        
        return nil
    }
    
}
