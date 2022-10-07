//
//  RoomsViewModel.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import Foundation

class RoomsViewModel {
    var datas: [Room] = [Room]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?

    private var cellViewModels: [RoomsListCellViewModel] = [RoomsListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }

    func getData(){
        showLoading?()
        ApiClient.getRoomsDataFromServer { (success, data) in
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
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> RoomsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Room]){
        self.datas = datas
        var vms = [RoomsListCellViewModel]()
        for data in datas {
            vms.append(RoomsListCellViewModel(createdAt: data.createdAt ?? "",
                                              isOccupied: data.isOccupied ?? false,
                                              maxOccupancy: data.maxOccupancy ?? 0,
                                              id: data.id ?? ""))
        }
        cellViewModels = vms
    }
}
