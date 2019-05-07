//
//  KMPageControl.swift
//  KMPageControlDemo
//
//  Created by KM on 2019/5/6.
//  Copyright © 2019 clou. All rights reserved.
//

import Foundation

public class KMPageControl: UIPageControl {
    
    /// 活跃指示器颜色
    var activeColor: UIColor = UIColor(red:0.871, green:0.263, blue:0.239, alpha: 1.000)
    
    /// 非活跃指示器颜色
    var inactiveColor: UIColor = UIColor(red:0.886, green:0.890, blue:0.898, alpha: 1.000)
    
    /// 活跃指示器大小
    var activeSize: CGSize = CGSize(width: 13, height: 5)
    
    /// 非活跃指示器大小
    var inactiveSize: CGSize = CGSize(width: 5, height: 5)
    
    override public var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    /// 更新指示器
    func updateDots() {
        pageIndicatorTintColor = .clear
        currentPageIndicatorTintColor = .clear
        for (index, item) in subviews.enumerated() {
            let imageV = self.imageView(for: item, current: currentPage)
            let centerPoint = CGPoint(x: item.bounds.midX, y: item.bounds.midY)
            let isActive = index == currentPage
            let size = isActive ? activeSize : inactiveSize
            let color = isActive ? activeColor : inactiveColor
            UIView.animate(withDuration: 0.25) {
                imageV?.frame = CGRect(center: centerPoint, size: size)
                imageV?.layer.cornerRadius = min(size.width, size.height)/2.0
                imageV?.backgroundColor = color
            }
        }
    }
    func imageView(for subview: UIView, current page: Int) -> UIImageView?   {
        
        if let imageV = subview as? UIImageView {
            return imageV
        }
        
        if let imageV = subview.subviews.first(where: { $0.isKind(of: UIImageView.self)
        }) as? UIImageView {
            return imageV
        }
        
        let imageV  = UIImageView(frame: subview.bounds)
        subview.addSubview(imageV)
        return imageV
    }
}

// MARK: ---------------- extension ----------------
public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.init()
        origin = CGPoint(x: center.x - size.width/2, y: center.y - size.height/2)
        self.size = size
    }
}
public extension UIScrollView {
    var pageNumber: Int {
        get { return Int(contentOffset.x / frame.size.width) }
        set { contentOffset.x = frame.size.width * CGFloat(newValue) }
    }
}
