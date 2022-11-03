//
//  RoomsConfig.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 31/10/22.
//

import UIKit

struct RoomsConfig: GenericCallConfig {

    let requestMethod: RequestMethod = .get
    let path = "v1/rooms"
    var queryItems: [URLQueryItem]?
    
    func params() -> RequestParams? {
        
        return nil
    }
    
}
