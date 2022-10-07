//
//  PersonDetailsViewController.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 07/10/22.
//

import UIKit
import QuartzCore

class PersonDetailsViewController: UIViewController {
    
    var viewModel:PersonListCellViewModel?
    var urlString: String? {
        didSet {
            if let urlStr = urlString, let url = URL(string: urlStr) {
                loadImage(from: url)
            }
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.detailsTableView.rowHeight = UITableView.automaticDimension
        self.urlString = self.viewModel?.avatar
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width/2
    }
    
}

extension PersonDetailsViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = UITableViewCell()
        
        switch indexPath.row {
            
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "First Name", for: indexPath)
            if let str = viewModel?.firstName {
                cell.textLabel?.text = "First Name: " + str
            }
            
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "Last Name", for: indexPath)
            if let str = viewModel?.lastName {
                cell.textLabel?.text = "Last Name: " + str
            }

        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "Created At", for: indexPath)
            if let str = viewModel?.createdAt {
                cell.textLabel?.text = "Created At: " + str
            }

        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "Email", for: indexPath)
            if let str = viewModel?.email {
                cell.textLabel?.text = "Email: " + str
            }

        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "Job Title", for: indexPath)
            if let str = viewModel?.jobtitle {
                cell.textLabel?.text = "Job Title: " + str
            }

        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: "Favourite Color", for: indexPath)
            if let str = viewModel?.favouriteColor {
                cell.textLabel?.text = "Favourite Color: " + str
            }

        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "Id Number", for: indexPath)
            if let str = viewModel?.id {
                cell.textLabel?.text = "Id Number: " + str
            }
        }
        return cell
    }
}

extension PersonDetailsViewController {
    // Load image from URL
    func loadImage(from url: URL) {
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.avatarImageView?.image = loadedImage
                }
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

class PersonDetailsViewControllerFactory {
    func createPersonDetailsViewControllerWith(item: PersonListCellViewModel) -> PersonDetailsViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
        vc.viewModel = item
        return vc
    }
}

