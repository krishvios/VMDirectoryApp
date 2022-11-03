//
//  PersonDetailsViewModelTests.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import XCTest
@testable import VMDirectory

final class PersonDetailsViewModelTests: XCTestCase {

    private var personDetailsFactoryMock: PersonDetailsViewControllerFactoryMock!
    private var personDetailsCellViewModel: PersonListCellViewModel?
    private var personDetailsCellVCMock: PersonDetailsViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        personDetailsFactoryMock = PersonDetailsViewControllerFactoryMock()
        personDetailsCellVCMock = personDetailsFactoryMock.getPersonDetailsViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
