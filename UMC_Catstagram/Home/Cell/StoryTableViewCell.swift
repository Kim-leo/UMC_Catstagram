//
//  StoryTableViewCell.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/08.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "StoryTableViewCell"
    
    //collectionView 선언
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return cv
    }()
    
    // MARK: - 동작영역
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        let storyNib = UINib(nibName: StoryCollectionViewCell.cellIdentifier, bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: StoryCollectionViewCell.cellIdentifier)
        
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.backgroundColor = .green
        
        self.addSubview(collectionView)
        collectionViewAutoLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionViewAutoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
