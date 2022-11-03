//
//  RoomsRequest.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 31/10/22.
//

import UIKit

class RoomsRequest: AppRequest {
    
    @discardableResult func query(success: @escaping (RoomsResponse) -> Void, failure: @escaping (AppAPIError) -> Void) -> URLSessionDataTask? {
        
        let config = RoomsConfig()
        let apiCall = AppAPICall(responseParser: RoomsParser(), errorMapper: AppAPIErrorMapper())
        
        return apiCall.query(config: config, success: { response in
            
            success(response)
            
        }, failure: { [weak self] error  in
            
            self?.tryToHandleError(error: error, success: {
                
                apiCall.query(config: config, success: { response in
                    
                    success(response)
                }, failure: failure)
                
            }, failure: { error in
                
                failure(error)
            })
        })
    }
    
}
