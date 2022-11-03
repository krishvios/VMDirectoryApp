//
//  GenericResponseParser.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 27/10/22.
//

import Foundation

protocol GenericResponseParser {
    
    associatedtype GenericReponseEntity
    associatedtype Json
    
    func parseData(data: Data?) -> GenericReponseEntity?
    
}
