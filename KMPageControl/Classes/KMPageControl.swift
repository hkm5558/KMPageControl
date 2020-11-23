//
//  KMPageControl.swift
//  KMPageControlDemo
//
//  Created by KM on 2019/5/6.
//  Copyright © 2019 KM. All rights reserved.
//

import UIKit

public class KMPageControl: UIPageControl {
    
    /// 活跃指示器颜色
    public var activeColor = UIColor(red:0.871, green:0.263, blue:0.239, alpha: 1.000)
    
    /// 非活跃指示器颜色
    public var inactiveColor = UIColor(red:0.886, green:0.890, blue:0.898, alpha: 1.000)
    
    /// 活跃指示器大小
    public var activeSize = CGSize(width: 13, height: 5)
    
    /// 非活跃指示器大小
    public var inactiveSize = CGSize(width: 5, height: 5)

    private let magicTag = "KMPageControl".hash

    /// 指示器间距
    public var dotSpacing: CGFloat = 5.0 {
        didSet {
            updateDots()
        }
    }
    
    override public var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateDots(animated: false)
    }
    /// 更新指示器
    func updateDots(animated: Bool = true) {
        guard numberOfPages > 0 else { return }
        let view = self
        let spacing = dotSpacing
        let dotsTotalW: CGFloat = CGFloat(numberOfPages - 1)
            * (inactiveSize.width + spacing)
            + activeSize.width
        let totalW = view.bounds.width

        var startX: CGFloat = totalW > dotsTotalW
            ? (totalW - dotsTotalW)/2.0
            : 0
        for idx in (0..<numberOfPages) {
            let isActive = idx == currentPage
            let color = isActive ? activeColor : inactiveColor
            let size = isActive ? activeSize: inactiveSize
            let imageV = self.imageView(for: view, index: idx)
            let pointX = startX
            let pointY = view.bounds.midY - size.height/2.0

            let change = {
                imageV?.frame = .init(x: pointX, y: pointY, width: size.width, height: size.height)
                imageV?.layer.cornerRadius = min(size.width, size.height)/2.0
                imageV?.backgroundColor = color
            }
            if animated {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                    change()
                })
            }else {
                change()
            }
            startX += size.width + spacing
        }
    }
    func imageView(for view: UIView, index page: Int) -> UIImageView?   {
        let tag = magicTag + page
        if let imageV = view.viewWithTag(tag) as? UIImageView {
            return imageV
        }
        let imageV  = UIImageView()
        imageV.tag = tag
        view.addSubview(imageV)
        return imageV
    }
}

//// MARK: ---------------- extension ----------------
//public extension CGRect {
//    init(center: CGPoint, size: CGSize) {
//        self.init()
//        origin = CGPoint(x: center.x - size.width/2, y: center.y - size.height/2)
//        self.size = size
//    }
//}
//public extension UIScrollView {
//    var pageNumber: Int {
//        get { return Int(contentOffset.x / frame.size.width) }
//        set { contentOffset.x = frame.size.width * CGFloat(newValue) }
//    }
//}
