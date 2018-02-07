//
//  TabBarController.swift
//  BrokenWebViews
//
//  Created by Justin D'Arcangelo on 2/7/18.
//  Copyright © 2018 Justin D'Arcangelo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let webViewControllerOne = WebViewController()
    let webViewControllerTwo = WebViewController()
    let webViewControllerThree = WebViewController()
    let webViewControllerFour = WebViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        webViewControllerOne.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "first"), tag: 0)
        webViewControllerTwo.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "second"), tag: 1)
        webViewControllerThree.tabBarItem = UITabBarItem(title: "Third", image: UIImage(named: "first"), tag: 2)
        webViewControllerFour.tabBarItem = UITabBarItem(title: "Fourth", image: UIImage(named: "second"), tag: 3)

        viewControllers = [webViewControllerOne, webViewControllerTwo, webViewControllerThree, webViewControllerFour]
    }
}
