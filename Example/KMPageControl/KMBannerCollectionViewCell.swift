//
//  KMBannerCollectionViewCell.swift
//  KMPageControl_Example
//
//  Created by KM on 2019/5/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
class KMBannerCollectionViewCell: UICollectionViewCell {
    
    lazy var imageViewBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.7
        view.layer.shadowColor = UIColor(red:0.969, green:0.322, blue:0.282, alpha: 1.000).cgColor
        view.layer.shadowOffset = .init(width: 0.5, height: 3)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.layer.cornerRadius = 8
        imageV.layer.masksToBounds = true
        imageV.backgroundColor = UIColor(red:0.820, green:0.235, blue:0.216, alpha: 1.000)
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    func commonInit() {
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup()     {
        contentView.addSubview(imageViewBackgroundView)
        contentView.addSubview(imageView)
    }
    func initialize_layout()    {
        let rect = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: 200 - 40)
        imageViewBackgroundView.frame = rect
        imageView.frame = rect
    }
}

