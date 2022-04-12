//
//  FeedTableViewCell.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/08.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    static let cellIdentifier = "FeedTableViewCell"
    
    
    // MARK: - UIComponent
    let userProfileImageView: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView: UIImageView = UIImageView()
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.backgroundColor = .systemGray3
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leo"
        label.font = UIFont.systemFont(ofSize: CGFloat(13))
        return label
    }()
    
    let moreButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_more"), for: .normal)
        return btn
    }()
    
    let feedImageView: UIImageView = {
        let imageView = UIImageView()
        //nothing yet
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_heart"), for: .normal)
        return btn
    }()
    
    let commentButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_comment"), for: .normal)
        return btn
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_home_send"), for: .normal)
        return btn
    }()
    
    let bookMarkButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_bookmark_white"), for: .normal)
        return btn
    }()
    
    let likeLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 4개"
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(15))
        return label
    }()
    
    let feedLabel: UILabel = {
        let label = UILabel()
        label.text = "Leo Leo Leo"
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: label.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        label.attributedText = attributedStr
        return label
    }()
    
    let myProfileImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "person.fill")
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.backgroundColor = .systemGray3
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    let commentTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "댓글 달기"
        tf.font = UIFont(name: "System", size: 14)
        tf.borderStyle = .none
        return tf
    }()
    
    // MARK: - 동작영역
    override func awakeFromNib() {
        super.awakeFromNib()
        addComponentsToScreen()
        //self.addSubview(likeButton)
        likeButton.addTarget(self, action: #selector(likeButtonClicked(_:)), for: .touchUpInside)
        bookMarkButton.addTarget(self, action: #selector(bookMarkButtonClicked(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Button Acntion 함수
    @objc func likeButtonClicked(_ sender: UIButton) {
        //실행됨
        if likeButton.isSelected {
            likeButton.setImage(UIImage(named: "ic_home_heart"), for: .normal)
            likeButton.isSelected = false
        } else {
            likeButton.setImage(UIImage(named: "ic_home_heart_full"), for: .normal)
            likeButton.isSelected = true
        }
        
    }
    
    @objc func bookMarkButtonClicked(_ sender: UIButton) {
        if bookMarkButton.isSelected {
            bookMarkButton.setImage(UIImage(named: "ic_bookmark_white"), for: .normal)
            bookMarkButton.isSelected = false
        } else {
            bookMarkButton.setImage(UIImage(named: "ic_bookmark_black"), for: .normal)
            bookMarkButton.isSelected = true
        }
        
    }
    
    
     
    // MARK: - AutoLayout()
    func addComponentsToScreen() {
        self.addSubview(userProfileImageView)
        userProfileImageViewAutoLayout()
        self.addSubview(userNameLabel)
        userNameLabelAutoLayout()
        self.addSubview(moreButton)
        moreButtonAutoLayout()
        self.addSubview(feedImageView)
        feedImageViewAutoLayout()
        self.addSubview(likeButton)
        likeButtonAutoLayout()
        self.addSubview(commentButton)
        commentButtonAutoLayout()
        self.addSubview(sendButton)
        sendButtonAutoLayout()
        self.addSubview(bookMarkButton)
        bookMarkButtonAutoLayout()
        self.addSubview(likeLabel)
        likeLabelAutoLayout()
        self.addSubview(feedLabel)
        feedLabelAutoLayout()
        self.addSubview(myProfileImageView)
        myProfileImageViewAutoLayout()
        self.addSubview(commentTextField)
        commentTextFieldAutoLayout()
    }
    
    func userProfileImageViewAutoLayout() {
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        userProfileImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        userProfileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        userProfileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func userNameLabelAutoLayout() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.centerYAnchor.constraint(equalTo: userProfileImageView.centerYAnchor).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func moreButtonAutoLayout() {
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        moreButton.centerYAnchor.constraint(equalTo: userNameLabel.centerYAnchor).isActive = true
    }
    
    func feedImageViewAutoLayout() {
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        feedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        feedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        feedImageView.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor, constant: 10).isActive = true
        feedImageView.heightAnchor.constraint(equalTo: feedImageView.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func likeButtonAutoLayout() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.widthAnchor.constraint(equalToConstant: 23).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: userProfileImageView.leadingAnchor).isActive = true
        likeButton.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 10).isActive = true
    }
    
    func commentButtonAutoLayout() {
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 13).isActive = true
        commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
    }
    
    func sendButtonAutoLayout() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.widthAnchor.constraint(equalTo: likeButton.widthAnchor).isActive = true
        sendButton.heightAnchor.constraint(equalTo: likeButton.heightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        sendButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 13).isActive = true
    }
    
    func bookMarkButtonAutoLayout() {
        bookMarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookMarkButton.widthAnchor.constraint(equalToConstant: 21).isActive = true
        bookMarkButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        bookMarkButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        bookMarkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func likeLabelAutoLayout() {
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor).isActive = true
        likeLabel.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 10).isActive = true
        likeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        likeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func feedLabelAutoLayout() {
        feedLabel.translatesAutoresizingMaskIntoConstraints = false
        feedLabel.leadingAnchor.constraint(equalTo: likeLabel.leadingAnchor).isActive = true
        feedLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 10).isActive = true
        feedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func myProfileImageViewAutoLayout() {
        myProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        myProfileImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        myProfileImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        myProfileImageView.leadingAnchor.constraint(equalTo: userProfileImageView.leadingAnchor).isActive = true
        myProfileImageView.topAnchor.constraint(equalTo: feedLabel.bottomAnchor, constant: 13).isActive = true
        myProfileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
    }
    
    func commentTextFieldAutoLayout() {
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.centerYAnchor.constraint(equalTo: myProfileImageView.centerYAnchor).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: myProfileImageView.trailingAnchor, constant: 7).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        commentTextField.heightAnchor.constraint(equalTo: myProfileImageView.heightAnchor).isActive = true
    }
}


