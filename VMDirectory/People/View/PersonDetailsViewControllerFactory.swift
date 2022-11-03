//
//  PersonDetailsViewControllerFactory.swift
//  VMDirectory
//
//  Created by ANSK Vivek on 22/10/22.
//

import UIKit

class PersonDetailsViewControllerFactory {
    
    func createPersonDetailsViewControllerWith(item: PersonListCellViewModel) -> PersonDetailsViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
        vc.viewModel = item
        return vc
    }
    
}


