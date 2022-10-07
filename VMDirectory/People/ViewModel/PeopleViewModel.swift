//
//  PeopleViewModel.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import Foundation

class PeopleViewModel {
    var datas: [Person] = [Person]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?

    private var cellViewModels: [PersonListCellViewModel] = [PersonListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }

    func getData(){
        showLoading?()
        ApiClient.getPeopleDataFromServer { (success, data) in
            self.hideLoading?()
            if success {
                self.createCell(datas: data!)
                self.reloadTableView?()
            } else {
                self.showError?()
            }
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> PersonListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Person]){
        self.datas = datas
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
