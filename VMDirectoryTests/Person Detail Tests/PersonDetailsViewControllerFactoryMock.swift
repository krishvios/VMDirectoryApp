//
//  PersonDetailsViewControllerFactoryMock.swift
//  VMDirectoryTests
//
//  Created by ANSK Vivek on 03/11/22.
//

import XCTest
@testable import VMDirectory

final class PersonDetailsViewControllerFactoryMock: PersonDetailsViewControllerFactory {

    var mockPersonListCellViewModelObj:PersonListCellViewModel?
    
    
    init(mockPersonListCellViewModelObj: PersonListCellViewModel? = nil) {
        self.mockPersonListCellViewModelObj = PersonListCellViewModel(createdAt:  "2022-01-24T17:02:23.729Z",
                                                                      firstName: "Maggie",
                                                                      avatar: "https://randomuser.me/api/portraits/women/21.jpg",
                                                                      lastName: "Brekke",
                                                                      email: "Crystel.Nicolas61@hotmail.com",
                                                                      jobtitle: "Future Functionality Strategist",
                                                                      favouriteColor: "pink",
                                                                      id: "1")
        
    }
    
    func getPersonDetailsViewController() -> PersonDetailsViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
        vc.viewModel = mockPersonListCellViewModelObj
        return vc
    }
}
