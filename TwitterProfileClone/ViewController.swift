//
//  ViewController.swift
//  TwitterProfileClone
//
//  Created by Sean Robertson on 3/16/15.
//  Copyright (c) 2015 Sean Robertson. All rights reserved.
//

import UIKit

let min_header: CGFloat = 22
let bar_offset: CGFloat = 110

class ViewController: UIViewController, UIScrollViewDelegate, SubScrollDelegate {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var barView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
      UIApplication.shared.statusBarStyle = .lightContent
        headerView.layer.zPosition = 1
        containerView.layer.zPosition = 2
        barView.layer.zPosition = 0
    }

    func subScrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y

        if offset < 0 {
            var headerTransform = CATransform3DIdentity
            let headerScaleFactor:CGFloat = -(offset) / headerView.bounds.height
            let headerSizevariation = ((headerView.bounds.height * (1.0 + headerScaleFactor)) - headerView.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            headerView.layer.transform = headerTransform
        } else {
            var headerTransform = CATransform3DIdentity
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-(headerView.bounds.height-min_header), -offset), 0)
            headerView.layer.transform = headerTransform
        }

        if (headerView.bounds.height-min_header) < offset {
            headerView.layer.zPosition = 3
        } else {
            headerView.layer.zPosition = 0
        }

        if (headerView.bounds.height-min_header+bar_offset) < offset {
            barView.layer.zPosition = 3
        } else {
            barView.layer.zPosition = 1
        }

        var barTransform = CATransform3DIdentity
        barTransform = CATransform3DTranslate(barTransform, 0, max(-(headerView.bounds.height-min_header+bar_offset), -offset), 0)
        barView.layer.transform = barTransform
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedProfile" {
          let profileVC = segue.destination as! ProfileViewController
            profileVC.delegate = self
        }
    }

}

