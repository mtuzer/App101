//
//  viewControllerExtension.swift
//  App101
//
//  Created by Mert Tuzer on 21.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

extension UIViewController {
    func setTabImages(selected: String, unselected: String) {
        self.tabBarItem.image = UIImage(named: unselected)?.withRenderingMode(.alwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: selected)?.withRenderingMode(.alwaysOriginal)
    }
}
