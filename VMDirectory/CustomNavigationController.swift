//
//  CustomNavigationController.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 05/10/22.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        modalPresentationCapturesStatusBarAppearance = true
        self.navigationBar.backgroundColor = UIColor(named: "VMBrand")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
