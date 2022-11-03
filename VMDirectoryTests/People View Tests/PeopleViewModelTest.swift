//
//  PeopleViewModelTest.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import XCTest
@testable import VMDirectory

final class PeopleViewModelTest: XCTestCase {

    var mockPeopleVieModelObj: PeopleViewModel?
    var getPeopleRequestMock: MockPeopleRequest?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.mockPeopleVieModelObj = PeopleViewModel()
        self.getPeopleRequestMock = MockPeopleRequest()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        mockPeopleVieModelObj = nil
    }

    func testFetchPeopleData() {
        // When start fetch
        getPeopleRequestMock?.testFetchPeopleData()

        // Assert
        XCTAssert(getPeopleRequestMock!.isFetchPeopleDataCalled)
    }
    
}
