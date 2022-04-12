//
//  HomeViewController.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UIComponents
    let catstagramImage: UIImageView = {
        let catstagramLogo = UIImage(named: "ic_catstagram_logo")
        let imageView: UIImageView = UIImageView()
        imageView.image = catstagramLogo
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "ic_home_send"), for: .normal)
        return btn
    }()
    
    let heartButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_heart"), for: .normal)
        return btn
    }()
    
    let uploadButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_upload"), for: .normal)
        return btn
    }()
    
    let tableView: UITableView = {
        let tbview = UITableView()
        return tbview
    }()
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        let feedNib = UINib(nibName: FeedTableViewCell.cellIdentifier, bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: FeedTableViewCell.cellIdentifier)
        let storyNib = UINib(nibName: StoryTableViewCell.cellIdentifier, bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: StoryTableViewCell.cellIdentifier)
        
        addComponentsToScreen()
        
        
    }

    // MARK: - AutoLayout()
    func addComponentsToScreen() {
        view.addSubview(catstagramImage)
        catstagramImageAutoLayout()
        view.addSubview(sendButton)
        sendButtonAutoLayout()
        view.addSubview(heartButton)
        heartButtonAutoLayout()
        view.addSubview(uploadButton)
        uploadButtonAutoLayout()
        view.addSubview(tableView)
        tableViewAutoLayout()
    }
    
    func catstagramImageAutoLayout() {
        catstagramImage.translatesAutoresizingMaskIntoConstraints = false
        catstagramImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        catstagramImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        catstagramImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        catstagramImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func sendButtonAutoLayout() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.centerYAnchor.constraint(equalTo: catstagramImage.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    func heartButtonAutoLayout() {
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        heartButton.centerYAnchor.constraint(equalTo: catstagramImage.centerYAnchor).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -15).isActive = true
    }
    
    func uploadButtonAutoLayout() {
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        uploadButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        uploadButton.centerYAnchor.constraint(equalTo: catstagramImage.centerYAnchor).isActive = true
        uploadButton.trailingAnchor.constraint(equalTo: heartButton.leadingAnchor, constant: -15).isActive = true
    }
    
    func tableViewAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: catstagramImage.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

    

//MARK: - TableView
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.cellIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellIdentifier, for: indexPath) 
            cell.selectionStyle = .none
            return cell
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return 600
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else { return }
      
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.cellIdentifier, for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}







