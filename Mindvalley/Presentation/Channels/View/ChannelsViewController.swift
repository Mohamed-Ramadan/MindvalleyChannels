//
//  ChannelsViewController.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import UIKit

typealias ChannelsDataSource = UICollectionViewDiffableDataSource<String, MediaModel>

class ChannelsViewController: UIViewController {

    static let identifier = String(describing: ChannelsViewController.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: ChannelsDataSource!
    private var channeclsViewModel: ChannelsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Channels"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        bindViewModel()
        
        collectionView.register(TitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderView.reuseIdentifier)
        collectionView.register(SeriesCoursesHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeriesCoursesHeaderView.reuseIdentifier)
        
        
        let newEpisodeNib = UINib(nibName: NewEpisodeCollectionViewCell.reuseIdentifier, bundle: nil)
        collectionView.register(newEpisodeNib, forCellWithReuseIdentifier: NewEpisodeCollectionViewCell.reuseIdentifier)
        
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        configureDataSource()
        configureSnapshot() 
    }
    
    private func bindViewModel() {
        channeclsViewModel = ChannelsViewModel()
        channeclsViewModel.update()
        
        channeclsViewModel.reloadCompletionHandler = {
            self.configureSnapshot()
        }
    }
}


extension ChannelsViewController {
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            
            let sectionType = self.channeclsViewModel.medias[sectionIndex].type
            
            switch sectionType {
            case .NEWEPISODES:
                section = self.getNewEpisodesSection()
            case .SERIES, .COURSE:
                section = self.getSeriesesCounrsesSection(sctionType: sectionType)
            default:
                section = self.getCategoriesSection()
                break
            }
            
            return section
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider:  sectionProvider)
    }
    
    private func getNewEpisodesSection() -> NSCollectionLayoutSection? {
        //create item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20.0)
        
        //create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = getHeader()
        
        return section
    }
    
    private func getCategoriesSection() -> NSCollectionLayoutSection? {
        //create item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20.0)
        
        //create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = getHeader()
        
        return section
    }
    
    
    private func getSeriesesCounrsesSection(sctionType: ChannelsViewModel.SectionType) -> NSCollectionLayoutSection? {
        //create item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(sctionType == .SERIES ? 0.9 : 0.45), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(sctionType == .SERIES ? 0.4 : 0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20.0)
        
        //create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = getHeader()
        
        return section
    }
    
    private func getHeader() -> [NSCollectionLayoutBoundarySupplementaryItem] {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        return [sectionHeader]
    }
}

extension ChannelsViewController {
    func configureDataSource() {
        dataSource = ChannelsDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, media: MediaModel) -> UICollectionViewCell? in
            
            var reuseIdentifier: String = NewEpisodeCollectionViewCell.reuseIdentifier
            
//            switch indexPath.section {
//            case 0: reuseIdentifier =  NewEpisodeCollectionViewCell.reuseIdentifier
//            case 1: reuseIdentifier = NewEpisodeCollectionViewCell.reuseIdentifier
//            //case 2: reuseIdentifier = RecomentationsCell.reuseIdentifier
//            default: break//reuseIdentifier = RecomentationsCell.reuseIdentifier
//            }
//

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as?  MediaCell else {
                return nil
            }
           
            cell.showMedia(media: (self.channeclsViewModel.medias[indexPath.section].media[indexPath.row]))
            
            return cell
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indextPath: IndexPath) -> UICollectionReusableView? in
            
            guard let self = self else { return nil }
            
            let section = self.channeclsViewModel.medias[indextPath.section]
            
            switch section.type {
            case .NEWEPISODES, .CATAGORIES:
                if let headerSupplementaryView =
                    collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader
                                                                    , withReuseIdentifier: TitleHeaderView.reuseIdentifier, for: indextPath) as? TitleHeaderView {
                    let section = self.dataSource.snapshot().sectionIdentifiers[indextPath.section]
                    headerSupplementaryView.textLabel.text = section
                    
                    return headerSupplementaryView
                }
            case .SERIES, .COURSE:
                if let headerSupplementaryView =
                    collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader
                                                                    , withReuseIdentifier: SeriesCoursesHeaderView.reuseIdentifier, for: indextPath) as? SeriesCoursesHeaderView {
                    //let section = self.dataSource.snapshot().sectionIdentifiers[indextPath.section]
                    headerSupplementaryView.textLabel.text = section.title
                    headerSupplementaryView.iconImageView.loadImage(from: URL(string: section.headerIcon ?? "")!)
                    headerSupplementaryView.mediaCountLabel.text = "\(section.mediaCount ?? 0) \(section.type == .SERIES ? "series" : "courses")"
                    return headerSupplementaryView
                }
            }
            
            
            return nil
        }
    }
    
    func configureSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<String, MediaModel> ()
        
        self.channeclsViewModel.medias.forEach{ collection in
            currentSnapshot.appendSections([collection.title])
            currentSnapshot.appendItems(collection.media)
        }
        
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}
