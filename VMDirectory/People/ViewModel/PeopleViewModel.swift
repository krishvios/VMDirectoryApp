//
//  PeopleViewModel.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import Foundation

class PeopleViewModel {
    
    var people: [Person] = [Person]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    private let getPeopleRequest = PeopleRequest()
    private var task: URLSessionDataTask?

    private var cellViewModels: [PersonListCellViewModel] = [PersonListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }

    func fetchPeopleData() {
        showLoading?()
        self.task = self.getPeopleRequest.query(success: { [weak self] (response) in
            self?.task = nil
            self?.createCell(datas: response.people)
            self?.hideLoading?()
        }, failure: { [weak self]  (error) in
            guard let `self` = self else { return }
            self.task = nil
            self.hideLoading?()
        })
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> PersonListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Person]) {
        
        self.people = datas
        var vms = [PersonListCellViewModel]()
        for data in datas {
            vms.append(PersonListCellViewModel(createdAt: data.createdAt ?? "",
                                               firstName: data.firstName ?? "",
                                               avatar: data.avatar ?? "",
                                               lastName: data.lastName ?? "",
                                               email: data.email ?? "",
                                               jobtitle: data.jobtitle ?? "",
                                               favouriteColor: data.favouriteColor ?? "",
                                               id: data.id ?? ""))
        }
        cellViewModels = vms
    }
    
}
