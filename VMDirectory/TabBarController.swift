//
//  TabBarController.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 05/10/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        if let tabBarItem1 = self.tabBar.items?[0] {
            tabBarItem1.title = "People"
            tabBarItem1.image = UIImage(systemName: "p.square.fill")
            tabBarItem1.selectedImage = UIImage(systemName: "p.square")
        }
        if let tabBarItem2 = self.tabBar.items?[1] {
            tabBarItem2.title = "Rooms"
            tabBarItem2.image = UIImage(systemName: "r.square.fill")
            tabBarItem2.selectedImage = UIImage(systemName: "r.square")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }

    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]) {
        
    }

    func tabBarController(_ tabBarController: UITabBarController, willEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
    }

    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        
    }
    
    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return .portrait
    }

    func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
        return .portrait
    }
}
