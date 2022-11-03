//
//  PeopleRequest.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 30/10/22.
//

import UIKit

class PeopleRequest: AppRequest {
    
    @discardableResult func query(success: @escaping (PeopleResponse) -> Void, failure: @escaping (AppAPIError) -> Void) -> URLSessionDataTask? {
        
        let config = PeopleConfig()
        let apiCall = AppAPICall(responseParser: PeopleParser(), errorMapper: AppAPIErrorMapper())
        
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
