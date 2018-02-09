//
//  TabBarController.swift
//  BrokenWebViews
//
//  Created by Justin D'Arcangelo on 2/7/18.
//  Copyright © 2018 Justin D'Arcangelo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let links = [
        "https://kotaku.com/the-secret-douglas-adams-rpg-people-have-been-playing-f-1681986562",
        "http://www.eurogamer.net/articles/2017-07-14-zelda-breath-of-the-wild-captured-memories-locations-4857",
        "https://arstechnica.com/gadgets/2017/09/macos-10-13-high-sierra-the-ars-technica-review/",
        "http://ca.ign.com/articles/2018/02/07/sid-meiers-civilization-6-rise-and-fall-review",
        "http://www.eurogamer.net/articles/2018-02-02-dissidia-final-fantasy-nt-review",
        "https://arstechnica.com/gadgets/2017/09/ios-11-thoroughly-reviewed/6/#h1",
        "http://ca.ign.com/articles/2018/02/01/iconoclasts-review",
        "http://www.eurogamer.net/articles/2018-02-02-lost-sphear-review",
        "http://ca.ign.com/articles/2018/01/31/gorogoa-review",
        "http://driving.ca/porsche/macan/reviews/road-test/suv-review-2018-porsche-macan-gts",
        "https://www.reddit.com/r/podcasts/comments/7vcunq/weekly_podcast_post_submit_your_links_here/",
    ]

    var webViewControllers: [WebViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0 ..< 8 {
            guard let url = URL(string: links[i]) else {
                break
            }

            let webViewController = WebViewController()
            webViewController.tabBarItem = UITabBarItem(title: "#\(i + 1)", image: UIImage(named: "first"), tag: i + 1)
            webViewController.url = url
            webViewControllers.append(webViewController)
        }

        viewControllers = webViewControllers
    }
}
