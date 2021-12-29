//
//  ATabController.swift
//  Planner
//
//  Created by Arunima Dey on 5/30/21.
//  Copyright © 2021 Arunima Dey. All rights reserved.
//

import UIKit

@objc enum Tab: Int{
    case first = 0;
    case second
}

@objc protocol TabController{
    @objc func switchTab(to: Tab)
}

class ATabController: UIViewController{
    weak var tabDelegate: TabController?
}
