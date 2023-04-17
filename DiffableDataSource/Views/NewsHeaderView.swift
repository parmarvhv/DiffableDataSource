//
//  NewsHeaderView.swift
//  DiffableDataSource
//
//  Created by Vaibhav Parmar on 18/11/20.
//

import UIKit

struct NewsHeaderViewModel {
    var title: String
}


class NewsHeaderView: UICollectionReusableView {

    static let reuseIdentifier = "NewsHeaderView"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ model: NewsHeaderViewModel) {
        self.titleLabel.text = model.title
    }
}
