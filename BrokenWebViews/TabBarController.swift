//
//  TabBarController.swift
//  BrokenWebViews
//
//  Created by Justin D'Arcangelo on 2/7/18.
//  Copyright © 2018 Justin D'Arcangelo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var webViewControllers: [WebViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0 ..< 8 {
            let webViewController = WebViewController()
            webViewController.tabBarItem = UITabBarItem(title: "#\(i)", image: UIImage(named: "first"), tag: i)
            webViewControllers.append(webViewController)
        }

        viewControllers = webViewControllers
    }
}
