//
//  StoryCollectionViewCell.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/08.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "StoryCollectionViewCell"
    
    // MARK: - UIComponents
    let bigView: UIView = {
        let view = UIView()
        return view
    }()
    
    let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        return view
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 23
        return view
    }()
    
    let imageView: UIImageView = {
        let ProfileLogo = UIImage(systemName: "person.fill")
        let imageView: UIImageView = UIImageView()
        imageView.image = ProfileLogo
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .lightGray
        imageView.tintColor = .white
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leo"
        return label
    }()
    
    
    // MARK: - 동작 영역
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .green
        //addComponentsToView()
    }
    
    
    // MARK: - AutoLayout
    func addComponentsToView() {
        self.addSubview(bigView)
        bigViewAutoLayout()
        bigView.addSubview(grayView)
        grayViewAutoLayout()
        grayView.addSubview(whiteView)
        whiteViewAutoLayout()
        whiteView.addSubview(imageView)
        bigView.addSubview(userNameLabel)
        userNameLabelAutoLayout()
    }
    
    func bigViewAutoLayout() {
        bigView.translatesAutoresizingMaskIntoConstraints = false
        bigView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bigView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bigView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bigView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func grayViewAutoLayout() {
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.centerXAnchor.constraint(equalTo: bigView.centerXAnchor).isActive = true
        grayView.topAnchor.constraint(equalTo: bigView.topAnchor).isActive = true
        grayView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        grayView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func whiteViewAutoLayout() {
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.centerXAnchor.constraint(equalTo: grayView.centerXAnchor).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: grayView.centerYAnchor).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func imageViewAutoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func userNameLabelAutoLayout() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -2).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        userNameLabel.widthAnchor.constraint(equalTo: grayView.widthAnchor).isActive = true
    }

}
