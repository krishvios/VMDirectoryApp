//
//  MockPeopleRequest.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import Foundation
@testable import VMDirectory

class MockPeopleRequest: AppRequest {
    
    var isFetchPeopleDataCalled = false
    
    func testFetchPeopleData() {
        isFetchPeopleDataCalled = true
    }
    
}
