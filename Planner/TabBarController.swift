//
//  TabBarController.swift
//  Planner
//
//  Created by Arunima Dey on 5/30/21.
//  Copyright © 2021 Arunima Dey. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{
//    @objc func switchTab(to: Tab) {
//        let index = to.rawValue
//        guard let viewControllerCount = viewControllers?.count,
//          index >= 0 && index < viewControllerCount  else { return }
//        selectedIndex = index
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        guard let tabs = viewControllers else { return }
//        for aVC in tabs {
//          if let aTab = aVC as? ATabController {
//            aTab.tabDelegate = self
//          }
//        }
//    }
    
    var vc = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = vc;
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let child = segue.destination as? ATabController {
//          child.tabDelegate = self
//        }
//    }
}
