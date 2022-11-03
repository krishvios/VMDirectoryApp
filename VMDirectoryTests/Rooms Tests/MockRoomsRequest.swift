//
//  MockRoomsRequest.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import XCTest

@testable import VMDirectory

class MockRoomsRequest: RoomsRequest {
    
    var isFetchRoomsDataCalled = false
    
    func testFetchRoomsData() {
        isFetchRoomsDataCalled = true
    }
    
}
