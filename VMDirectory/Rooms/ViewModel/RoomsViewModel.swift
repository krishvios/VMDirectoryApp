//
//  RoomsViewModel.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import Foundation

class RoomsViewModel {
    
    var rooms: [Room] = [Room]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    private let getRoomsRequest = RoomsRequest()
    private var task: URLSessionDataTask?

    private var cellViewModels: [RoomsListCellViewModel] = [RoomsListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }

    func fetchRoomsData(){
        showLoading?()
        self.task = self.getRoomsRequest.query(success: { [weak self] (response) in
            self?.task = nil
            self?.createCell(datas: response.rooms)
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
    
    
    func getCellViewModel( at indexPath: IndexPath ) -> RoomsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Room]){
        self.rooms = datas
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
