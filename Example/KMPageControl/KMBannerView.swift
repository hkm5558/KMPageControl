//
//  KMBannerView.swift
//  KMPageControl_Example
//
//  Created by KM on 2019/5/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import KMPageControl

class KMBannerView: UIView {
    
    struct Banner {
        var image: UIImage?
        var url: String?
        init(image: UIImage?, url: String?) {
            self.image = image
            self.url = url
        }
        static func defaultBanner() -> Banner {
            return Banner(image: nil, url: nil)
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 200)
        let co = UICollectionView(frame: .zero, collectionViewLayout: layout)
        co.register(KMBannerCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: KMBannerCollectionViewCell.self))
        co.dataSource = self
        co.delegate = self
        co.backgroundColor = .white
        co.isPagingEnabled = true
        co.showsHorizontalScrollIndicator = false
        co.alwaysBounceHorizontal = true
        return co
    }()
    
    /// 指示器
    lazy var pageControl: KMPageControl = {
        let control = KMPageControl()
        return control
    }()
    
    var banners: [Banner] = [Banner.defaultBanner()] {
        didSet {
            if banners.isEmpty {
                banners = [Banner.defaultBanner()]
            }
            pageControl.numberOfPages = banners.count
            pageControl.currentPage = 0
            collectionView.setContentOffset(.zero, animated: true)
            collectionView.reloadData()
        }
    }
    
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
        addSubview(collectionView)
        addSubview(pageControl)
    }
    func initialize_layout()    {
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)

        pageControl.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 20)
    }
}
extension KMBannerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = scrollView.pageNumber
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            pageControl.currentPage = scrollView.pageNumber
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: KMBannerCollectionViewCell.self), for: indexPath) as? KMBannerCollectionViewCell) ?? KMBannerCollectionViewCell()
        let item = banners[indexPath.row]
        cell.imageView.image = item.image
        if let url = URL(string: item.url ?? "") {
            // load image from url
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did Tap Index \(indexPath.row)")
    }
}
public extension UIScrollView {
    var pageNumber: Int {
        get { return Int(contentOffset.x / frame.size.width) }
        set { contentOffset.x = frame.size.width * CGFloat(newValue) }
    }
}
