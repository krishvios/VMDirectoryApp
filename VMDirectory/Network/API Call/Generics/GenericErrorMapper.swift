//
//  GenericErrorMapper.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 27/10/22.
//

import Foundation

protocol GenericErrorMapper {
    
    associatedtype GenericError
    
    var createRequestError: GenericError { get }
    var parseError: GenericError { get }
    
    func map(error: NSError) -> GenericError
    func checkIfValidResponse(urlResponse: URLResponse?, data: Data?) -> GenericError?
    
}
