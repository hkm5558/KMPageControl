//
//  ViewController.swift
//  KMPageControl
//
//  Created by km on 05/07/2019.
//  Copyright (c) 2019 km. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var bannerView: KMBannerView = {
        let banner = KMBannerView(frame: .init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 220))
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(bannerView)
        bannerView.banners = (0...6).map({ (idx) in
            return KMBannerView.Banner(image: nil, url: nil)
        })
        bannerView.pageControl.activeSize = CGSize(width: 30, height: 10)
        bannerView.pageControl.inactiveSize = CGSize(width: 10, height: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

