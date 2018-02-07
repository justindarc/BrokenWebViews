//
//  WebViewController.swift
//  BrokenWebViews
//
//  Created by Justin D'Arcangelo on 2/7/18.
//  Copyright © 2018 Justin D'Arcangelo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(webView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[webView]|", options: .alignAllCenterX, metrics: nil, views: ["webView": webView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: .alignAllCenterY, metrics: nil, views: ["webView": webView]))

        webView.load(URLRequest(url: URL(string: "http://www.eurogamer.net/articles/2017-07-14-zelda-breath-of-the-wild-captured-memories-locations-4857")!))
    }
}
