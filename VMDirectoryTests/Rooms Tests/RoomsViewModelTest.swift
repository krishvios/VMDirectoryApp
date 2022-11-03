//
//  RoomsViewModelTest.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import XCTest
@testable import VMDirectory

final class RoomsViewModelTest: XCTestCase {

    var viewModel: RoomsViewModel?
    var rooms: [Room]?
    fileprivate var getRoomsRequestMockObj: MockRoomsRequest?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewModel = RoomsViewModel()
        self.rooms = [Room()]
        self.getRoomsRequestMockObj = MockRoomsRequest()
    }
    
    func testFetchRoomsData() {
        // When start fetch
        getRoomsRequestMockObj?.testFetchRoomsData()

        // Assert
        XCTAssert(getRoomsRequestMockObj!.isFetchRoomsDataCalled)
    }

}
