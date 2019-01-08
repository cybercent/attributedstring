//
//  FullArticleHeadlineCollectionViewCell.swift
//  Test
//
//  Created by Daniel Podaru on 07/01/2019.
//  Copyright © 2019 Daniel Podaru. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import Atributika

class FullArticleHeadlineCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    var title = AttributedLabel()
    var headline = AttributedLabel()
    var container = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierachy()
        setStyle()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(imageView.snp.width).dividedBy(1.29)
        }
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        headline.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setViewHierachy() {
        contentView.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(title)
        container.addSubview(headline)
    }

    func update(with imageURL: URL, title: String, headline: String) {
        imageView.kf.setImage(with: imageURL)

        let link = Style("a")
            .foregroundColor(.blue, .normal)
            .foregroundColor(.brown, .highlighted)
        let all = Style.font(.systemFont(ofSize: 20))
        
        self.title.attributedText = title.style(tags: [link]).styleAll(all)
        self.title.sizeToFit()

        self.headline.attributedText = headline.style(tags: [link]).styleAll(all)
        self.headline.sizeToFit()

        self.title.onClick = { label, detection in
            switch detection.type {
            case .link(let url):
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            default:
                break
            }
        }

        self.headline.onClick = { label, detection in
            switch detection.type {
            case .link(let url):
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            default:
                break
            }
        }
    }

    func setStyle() {
        title.numberOfLines = 0
        headline.numberOfLines = 0
    }
}
