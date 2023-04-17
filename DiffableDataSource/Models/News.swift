//
//  News.swift
//  DiffableDataSource
//
//  Created by Vaibhav Parmar on 18/11/20.
//

import UIKit

class News: Hashable {
    
    let image: UIImage
    let title: String
    let sourceImage: UIImage
    let sourceName: String
    let description: String
    let postedTime: String
    
    private let identifier = UUID()

    init(
        image: UIImage,
        title: String,
        sourceImage: UIImage,
        sourceName: String,
        description: String,
        postedTime: String) {
        self.image = image
        self.title = title
        self.sourceImage = sourceImage
        self.sourceName = sourceName
        self.description = description
        self.postedTime = postedTime
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    static func == (lhs: News, rhs: News) -> Bool {
      return lhs.identifier == rhs.identifier
    }
}
