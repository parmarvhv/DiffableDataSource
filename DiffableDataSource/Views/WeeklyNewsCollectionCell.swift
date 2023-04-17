//
//  WeeklyNewsCollectionCell.swift
//  DiffableDataSource
//
//  Created by Vaibhav Parmar on 18/11/20.
//

import UIKit

struct NewsCellModel {
    
    var news: News
    init(news: News) {
        self.news = news
    }
    
    var image: UIImage {return self.news.image}
    var title: String { return self.news.title }
    var sourceImage: UIImage { return self.news.sourceImage }
    var sourceName: String { return self.news.sourceName }
    var description: String { return self.news.description }
    var postedTime: String { return self.news.postedTime }

}

class WeeklyNewsCollectionCell: UICollectionViewCell {

    static let reuseIdentifier = "WeeklyNewsCollectionCell"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var sourceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: NewsCellModel) {
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.imageView.image = model.image
        self.sourceImageView.image = model.sourceImage
        self.postTimeLabel.text = model.postedTime
        self.sourceNameLabel.text = model.sourceName
    }
}
