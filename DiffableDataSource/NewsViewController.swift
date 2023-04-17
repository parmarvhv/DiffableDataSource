//
//  NewsViewController.swift
//  DiffableDataSource
//
//  Created by Vaibhav Parmar on 18/11/20.
//

import UIKit

typealias NewsDataSource = UICollectionViewDiffableDataSource<Section, News>
typealias NewsDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, News>


class NewsViewController: UIViewController {
    
    struct Identifiers {
        static let sectionHeaderKind = "newsCollectionViewSectionHeader"
        static let weekly = WeeklyNewsCollectionCell.reuseIdentifier
        static let trending = TrendingNewsCollectionCell.reuseIdentifier
        static let newsHeader = NewsHeaderView.reuseIdentifier
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: NewsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }

    func initialSetup() {
        self.title = "News"
        self.setupCollectionView()
        self.configureDataSource(self.createSnapshot())
    }

}

// MARK: Collection View Diffable DataSource
extension NewsViewController {
    
    func setupCollectionView() {
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.collectionView.delegate = self
        
        self.collectionView.register(
            TrendingNewsCollectionCell.nib,
            forCellWithReuseIdentifier: Identifiers.trending)
        
        self.collectionView.register(
            WeeklyNewsCollectionCell.nib,
            forCellWithReuseIdentifier: Identifiers.weekly)
        
        self.collectionView.register(
            NewsHeaderView.nib,
            forSupplementaryViewOfKind: Identifiers.sectionHeaderKind,
            withReuseIdentifier: Identifiers.newsHeader)
        
        self.collectionView.collectionViewLayout = self.generateLayout()
    }
    
    func configureDataSource(_ snapshot: NewsDataSourceSnapshot) {
        
        self.dataSource = UICollectionViewDiffableDataSource(
            collectionView: self.collectionView) { (collectionView, indexPath, news) -> UICollectionViewCell? in
            
            let section = Section.allSections[indexPath.section]
            switch section.type {
            case .trending:
                guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: Identifiers.trending,
                        for: indexPath) as? TrendingNewsCollectionCell else { fatalError("Could not create new cell")}
                cell.configure(NewsCellModel(news: news))
                return cell
            case .weekly:
                guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: Identifiers.weekly,
                        for: indexPath) as? WeeklyNewsCollectionCell else { fatalError("Could not create new cell") }
                cell.configure(NewsCellModel(news: news))
                return cell
            }
        }
        
        self.dataSource.supplementaryViewProvider = { (collectionView: UICollectionView,
                                                       kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: Identifiers.newsHeader,
                    for: indexPath) as? NewsHeaderView else {
                fatalError("Cannot create header view")
            }
            headerView.configure(NewsHeaderViewModel(title: Section.allSections[indexPath.section].title))
            return headerView
        }
        
        self.collectionView.dataSource = self.dataSource
        dataSource.apply(snapshot)
    }
    
    func createSnapshot() -> NewsDataSourceSnapshot {
        var snapshot = NewsDataSourceSnapshot()
        
        snapshot.appendSections(Section.allSections)
        Section.allSections.forEach {
            snapshot.appendItems($0.newsList, toSection: $0)
        }
        return snapshot
    }
}

// MARK: Generate Layouts
extension NewsViewController {
    
    private func generateLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let type = Section.allSections[sectionIndex].type
            switch type {
            case .trending: return self.generateTrendingLayout()
            case .weekly: return self.generateWeeklyLayout()
            }
        }
        return layout
    }
    
    func generateTrendingLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .estimated(44.0))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44.0))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: Identifiers.sectionHeaderKind,
          alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func generateWeeklyLayout() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(44))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: Identifiers.sectionHeaderKind,
          alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }
    
}

// MARK: UICollectionViewDelegate
extension NewsViewController: UICollectionViewDelegate {
    
}
