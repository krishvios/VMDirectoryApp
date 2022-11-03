//
//  RequestBuilder.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 27/10/22.
//

import Foundation

protocol RequestBuilder {

     func createRequest(config: GenericCallConfig) -> URLRequest?
    
}
