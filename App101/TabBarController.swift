//
//  TabBarController.swift
//  App101
//
//  Created by Mert Tuzer on 21.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit
// the main controller for the app, manipulates tabs and their navigations
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .black
        let vc1 = MoviesViewController()
        let nav = UINavigationController(rootViewController: DiscoverViewController())
        let vc2 = nav
        vc1.setTabImages(selected: "homeOn", unselected: "homeOff")
        vc2.setTabImages(selected: "searchOn", unselected: "search")
        viewControllers = [vc1, vc2]
    }

}
