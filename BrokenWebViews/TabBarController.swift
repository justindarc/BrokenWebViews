//
//  TabBarController.swift
//  BrokenWebViews
//
//  Created by Justin D'Arcangelo on 2/7/18.
//  Copyright © 2018 Justin D'Arcangelo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let urlThatFails = "http://www.eurogamer.net/articles/2017-07-14-zelda-breath-of-the-wild-captured-memories-locations-4857"
    let urlThatDoesntFail = "https://www.reddit.com/r/podcasts/comments/7vcunq/weekly_podcast_post_submit_your_links_here/"

    var webViewControllers: [WebViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0 ..< 8 {
            guard let url = URL(string: urlThatFails) else {
                break
            }

            let webViewController = WebViewController()
            webViewController.tabBarItem = UITabBarItem(title: "#\(i + 1)", image: UIImage(named: "tab"), tag: i + 1)
            webViewController.url = url
            webViewControllers.append(webViewController)
        }

        viewControllers = webViewControllers
    }
}
