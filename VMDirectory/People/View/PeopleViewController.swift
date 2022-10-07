//
//  PeopleViewController.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 06/10/22.
//

import UIKit

class PeopleViewController: UITableViewController {

    var activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .large)
        return activityView
    }()

    private let viewModel = PeopleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if !(activityIndicator.isDescendant(of: self.view)) {
            self.view.addSubview(activityIndicator)
        }
        initViewModel()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    func initViewModel(){
        viewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        viewModel.showError = {
            DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
        }
        viewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicator.startAnimating() }
        }
        viewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
        }
        viewModel.getData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonDetailsCell", for: indexPath) as? PersonDetailsCell else {
            fatalError("Cell not exists in storyboard")
        }
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        cell.textLabel?.text = cellVM.firstName + " " + cellVM.lastName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        self.navigationController?.pushViewController(PersonDetailsViewControllerFactory().createPersonDetailsViewControllerWith(item: cellVM), animated: true)
    }
}
