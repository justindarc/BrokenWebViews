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

    var url: URL?

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
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[webView]|", options: .alignAllCenterY, metrics: nil, views: ["webView": webView]))

        guard let url = self.url else {
            return
        }

        webView.load(URLRequest(url: url))
    }

    @objc func reload() {
        webView.reload()
    }
}
