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
    enum ScrollDirection {
        case up
        case down
    }

    let webView = WKWebView()
    let reloadButton = UIButton(type: .system)

    var lastContentOffset = CGPoint.zero
    var scrollDirection = ScrollDirection.down

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

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.delegate = self

        webView.scrollView.addGestureRecognizer(panGestureRecognizer)
        webView.scrollView.delegate = self

        lastContentOffset = webView.scrollView.contentOffset

        webView.load(URLRequest(url: URL(string: "http://www.eurogamer.net/articles/2017-07-14-zelda-breath-of-the-wild-captured-memories-locations-4857")!))
    }

    func showToolbar() {
        UIView.animate(withDuration: 0.2) {
            self.reloadButton.frame.origin.y = 30;
            self.view.constraints[2].constant = 100
            self.view.layoutIfNeeded()
        }
    }

    func hideToolbar() {
        UIView.animate(withDuration: 0.2) {
            self.reloadButton.frame.origin.y = -70;
            self.view.constraints[2].constant = 0
            self.view.layoutIfNeeded()
        }
    }

    @objc func reload() {
        webView.reload()
    }

    @objc func pan() {
        let delta = lastContentOffset.y - webView.scrollView.contentOffset.y
        lastContentOffset = webView.scrollView.contentOffset
        scrollDirection = (delta < 0) ? .up : .down
    }
}

extension WebViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension WebViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            if scrollDirection == .up {
                hideToolbar()
            } else {
                showToolbar()
            }
        }
    }
}
