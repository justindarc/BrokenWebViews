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
    let reloadButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.translatesAutoresizingMaskIntoConstraints = false

        reloadButton.frame = CGRect(x: 10, y: 30, width: 60, height: 40)
        reloadButton.layer.cornerRadius = 5
        reloadButton.layer.borderColor = UIColor.black.cgColor
        reloadButton.layer.borderWidth = 1
        reloadButton.backgroundColor = UIColor.white
        reloadButton.setTitle("Reload", for: .normal)
        reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)

        view.addSubview(webView)
        view.addSubview(reloadButton)

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[webView]|", options: .alignAllCenterX, metrics: nil, views: ["webView": webView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: .alignAllCenterY, metrics: nil, views: ["webView": webView]))

        webView.load(URLRequest(url: URL(string: "http://www.eurogamer.net/articles/2017-07-14-zelda-breath-of-the-wild-captured-memories-locations-4857")!))
    }

    @objc func reload() {
        webView.reload()
    }
}
